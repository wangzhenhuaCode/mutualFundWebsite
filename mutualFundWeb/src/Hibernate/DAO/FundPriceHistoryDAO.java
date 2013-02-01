package Hibernate.DAO;

import java.util.Date;
import java.util.List;

import Hibernate.BaseDAO.BaseHibernateDAO;
import Hibernate.PO.FundPriceHistory;
import Hibernate.PO.Transaction;

public class FundPriceHistoryDAO extends BaseHibernateDAO<FundPriceHistory> implements IFundPriceHistoryDAO {
	public void initDAO(){
		super.init(FundPriceHistory.class.getName());
	}
	public Date findLastTransitionDay(){
		try {
			String queryString = "from " + entityName

					+" order by id.priceDate desc";

			List<FundPriceHistory> list=getHibernateTemplate().find(queryString);
			if(list.size()>0){
				return list.get(0).getId().getPriceDate();
			}else
				return null;
		} catch (RuntimeException re) {
			throw re;
		}
		
	}
}
