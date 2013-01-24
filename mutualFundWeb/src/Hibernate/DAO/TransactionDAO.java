package Hibernate.DAO;

import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;

import Hibernate.BaseDAO.BaseHibernateDAO;
import Hibernate.PO.Fund;
import Hibernate.PO.FundPriceHistory;
import Hibernate.PO.Position;
import Hibernate.PO.PositionId;
import Hibernate.PO.Transaction;

public class TransactionDAO extends BaseHibernateDAO<Transaction> implements ITransactionDAO {
	public void initDAO(){
		super.init(Transaction.class.getName());
	}
	public List<Transaction> findPendingTransaction(final Date date,final Integer type){
		try {
			String queryString = "from " + entityName
					+ " where  transactionType="+type+" and executeDate<="+date.getTime();
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			throw re;
		}
		
	}
	public boolean transactionDay(final List<Transaction> buylist,final  List<Transaction> selllist,final List<Transaction> depositlist,final List<Transaction> withdrawlist,final List<FundPriceHistory> pricelist){
		boolean b=(Boolean) getHibernateTemplate().execute(new HibernateCallback() {
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				
				org.hibernate.Transaction tx=session.beginTransaction();
				try{
				HashMap<Integer, Long> map =new HashMap<Integer, Long>();
				DecimalFormat format1 = new DecimalFormat("#.##");
				DecimalFormat format2 = new DecimalFormat("#.###");
				for(FundPriceHistory fp:pricelist){
					session.save(fp);
					map.put(fp.getId().getFund().getFundId(), fp.getPrice());
				}
				for(Transaction t:buylist){
					Double cash=(double)t.getAmount()/100;
					Double price=(double)map.get(t.getFund().getFundId())/100;
					Double shares=Double.valueOf(format2.format(cash/price));
					t.setShares((long)(shares*1000));
					t.setTransactionType(Transaction.BOUGHT);
					Long ucash=t.getCustomer().getCash();
					t.getCustomer().setCash(ucash-t.getAmount());
					Position p=t.getPosition();
					if(p!=null){
						Long currentShares=p.getShares();
						currentShares+=t.getShares();
						p.setShares(currentShares);
						
					}else{
						p=new Position();
						Long currentShares=t.getShares();
						p.setShares(currentShares);
						PositionId pid=new PositionId();
						pid.setFund(t.getFund());
						pid.setCustomer(t.getCustomer());
						p.setId(pid);
					}
					t.setPosition(p);
					session.update(t);
				}
				for(Transaction t:selllist){
					Double shares=(double)t.getShares()/1000;
					Double price=(double)map.get(t.getFund().getFundId())/100;
					Double amount=Double.valueOf(format1.format(shares*price));
					t.setAmount((long)(amount*100));
					t.setTransactionType(Transaction.SELLED);
					Long ucash=t.getCustomer().getCash();
					t.getCustomer().setCash(ucash+t.getAmount());
					Position p=t.getPosition();
					
						Long currentShares=p.getShares();
						currentShares-=t.getShares();
						p.setShares(currentShares);
					
					t.setPosition(p);
					session.update(t);
				}
				for(Transaction t:depositlist){
					t.setTransactionType(Transaction.DEPOSITED);
					Long ucash=t.getCustomer().getCash();
					t.getCustomer().setCash(ucash+t.getAmount());
					session.update(t);
				}
				for(Transaction t:withdrawlist){
					t.setTransactionType(Transaction.WITHDRAW);
					Long ucash=t.getCustomer().getCash();
					t.getCustomer().setCash(ucash-t.getAmount());
					session.update(t);
				}
				
				tx.commit();
				return true;
				}catch(Exception e){
					tx.rollback();
					return false;
				}
			}
		});
		return b;
	}
}