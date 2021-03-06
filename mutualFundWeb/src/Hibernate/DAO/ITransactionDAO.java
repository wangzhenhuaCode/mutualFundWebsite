package Hibernate.DAO;

import java.util.Date;
import java.util.List;

import Hibernate.BaseDAO.IBaseHibernateDAO;
import Hibernate.PO.Customer;
import Hibernate.PO.FundPriceHistory;
import Hibernate.PO.Position;
import Hibernate.PO.Transaction;

public interface ITransactionDAO extends IBaseHibernateDAO<Transaction> {
	public List<Transaction> findPendingTransaction(final Date date,final Integer type);
	public boolean transactionDay(final List<Transaction> buylist,final  List<Transaction> selllist,final List<Transaction> depositlist,final List<Transaction> withdrawlist,final List<FundPriceHistory> pricelist,final Date date);
	public boolean operateTransaction(final Transaction trasanction, final Customer customer);
	public boolean operateTransaction(final Transaction trasanction, final Position position);
	public Date findLastTransitionDay();
}
