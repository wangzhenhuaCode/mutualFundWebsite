package Hibernate.DAO;

import java.util.List;

import Hibernate.BaseDAO.IBaseHibernateDAO;
import Hibernate.PO.Fund;

public interface IFundDAO extends IBaseHibernateDAO<Fund> {
	public List<Fund> search(final String keywords);
	public List<Fund> autoCompleteSearch(final String keywords);
}
