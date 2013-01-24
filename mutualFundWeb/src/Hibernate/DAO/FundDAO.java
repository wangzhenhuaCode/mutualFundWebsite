package Hibernate.DAO;

import java.util.List;

import Hibernate.BaseDAO.BaseHibernateDAO;
import Hibernate.BaseDAO.IBaseHibernateDAO;
import Hibernate.PO.Fund;

public class FundDAO extends BaseHibernateDAO<Fund> implements IFundDAO {
	public void initDAO(){
		super.init(Fund.class.getName());
	}
	@SuppressWarnings("unchecked")
	public List<Fund> search(final String keywords){
		try {
			String queryString = "from " + entityName
					+ " as model where model.symbol like %"+keywords+"%"+" or "+" model.name like %"+keywords+"%";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			throw re;
		}
	}
}
