package Hibernate.DAO;

import java.util.Date;

import Hibernate.BaseDAO.IBaseHibernateDAO;
import Hibernate.PO.FundPriceHistory;

public interface IFundPriceHistoryDAO extends
		IBaseHibernateDAO<FundPriceHistory> {
	public Date findLastTransitionDay();
}
