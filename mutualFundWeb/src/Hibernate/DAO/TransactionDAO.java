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
import Hibernate.PO.Customer;
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
	public Date findLastTransitionDay(){
		try {
			String queryString = "from " + entityName

					+" order by executeDate desc";

			List<Transaction> list=getHibernateTemplate().find(queryString);
			if(list.size()>0){
				return list.get(0).getExecuteDate();
			}else
				return null;
		} catch (RuntimeException re) {
			throw re;
		}
		
	}
	public boolean transactionDay(final List<Transaction> buylist,final  List<Transaction> selllist,final List<Transaction> depositlist,final List<Transaction> withdrawlist,final List<FundPriceHistory> pricelist,final Date date){
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
					Double cash=(double)t.getAmount()/(-100);
					Double price=(double)map.get(t.getFund().getFundId())/100;
					Double shares=Double.valueOf(format2.format(cash/price));
					t.setShares((long)(shares*1000));
					Customer customer=t.getCustomer();
					customer=(Customer) session.load(Customer.class, customer.getCustomerId());
					Long ucash=t.getAmount()+customer.getCash();
					/*if(ucash<0){
						continue;
					}*/
					customer.setCash(ucash);
					customer.setPendingCash((long)0);
					t.setTransactionType(Transaction.BOUGHT);
					PositionId pid=new PositionId(t.getCustomer(),t.getFund());
					
					Position p=(Position) session.load(Position.class, pid);
						Long currentShares=p.getShares();
						currentShares+=t.getShares();
						p.setShares(currentShares);
						
						
					
					
					t.setExecuteDate(date);
					session.merge(customer);
					session.merge(p);
					session.merge(t);
				}
				for(Transaction t:selllist){
					Double shares=(double)t.getShares()/1000;
					Double price=(double)map.get(t.getFund().getFundId())/100;
					Double amount=Double.valueOf(format1.format(shares*price));
					t.setAmount((long)(amount*100));
					
					Customer customer=t.getCustomer();
					customer=(Customer) session.load(Customer.class, customer.getCustomerId());
					Long ucash=t.getAmount()+customer.getCash();
					customer.setCash(ucash);
					customer.setPendingCash((long)0);
					
					PositionId pid=new PositionId(t.getCustomer(),t.getFund());
					
					Position p=(Position) session.load(Position.class, pid);
					
						Long currentShares=p.getShares();
						currentShares-=t.getShares();
						if(currentShares<0)continue;
						p.setShares(currentShares);
					
					t.setPosition(p);
					t.setExecuteDate(date);
					t.setTransactionType(Transaction.SELLED);
					p.setPendingShare(0L);
					session.merge(customer);
					session.merge(p);
					
					session.merge(t);
				}
				for(Transaction t:depositlist){
					t.setTransactionType(Transaction.DEPOSITED);
					Customer customer=t.getCustomer();
					customer=(Customer) session.load(Customer.class, customer.getCustomerId());
					Long ucash=t.getAmount()+customer.getCash();
					customer.setCash(ucash);
					customer.setPendingCash((long)0);
					t.setExecuteDate(date);
					session.merge(customer);
					session.merge(t);
				}
				for(Transaction t:withdrawlist){
					
					Customer customer=t.getCustomer();
					customer=(Customer) session.load(Customer.class, customer.getCustomerId());
					Long ucash=t.getAmount()+customer.getCash();
					/*
					if(ucash<0){
						continue;
					}*/
					customer.setPendingCash((long)0);
					customer.setCash(ucash);
					
					t.setTransactionType(Transaction.WITHDRAW);
					t.getCustomer().setCash(ucash);
					t.setExecuteDate(date);
					session.merge(customer);
					session.merge(t);
				}
				
				session.flush();
				
				tx.commit();
				return true;
				}catch(Exception e){
					tx.rollback();
					e.printStackTrace();
					return false;
				}
			}
		});
		return b;
	}
	public boolean operateTransaction(final Transaction trasanction, final Customer customer){
		boolean b=(Boolean) getHibernateTemplate().execute(new HibernateCallback() {
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				org.hibernate.Transaction tx=session.beginTransaction();
				try{
					if(customer!=null)
						session.merge(customer);
					session.save(trasanction);
					session.flush();
					
				}catch(Exception e){
					tx.rollback();
					e.printStackTrace();
					return false;
				}
				tx.commit();
				return true;
				
			}
			
			});
		return b;
	}
	
	public boolean operateTransaction(final Transaction trasanction, final Position position){
		boolean b=(Boolean) getHibernateTemplate().execute(new HibernateCallback() {
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				org.hibernate.Transaction tx=session.beginTransaction();
				try{
					
					session.merge(position);
					session.save(trasanction);
					session.flush();
				}catch(Exception e){
					tx.rollback();
					return false;
				}
				tx.commit();
				return true;
				
			}
			
			});
		return b;
	}
}
