package Struts.Action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import Hibernate.DAO.IFundDAO;
import Hibernate.DAO.IPositionDAO;
import Hibernate.DAO.ITransactionDAO;
import Hibernate.PO.Fund;
import Hibernate.PO.FundPriceHistory;
import Hibernate.PO.FundPriceHistoryId;
import Hibernate.PO.Transaction;

import com.opensymphony.xwork2.ActionSupport;

public class TransactionDayAction extends ActionSupport{
	private IFundDAO fundDAO;
	private IPositionDAO positionDAO;
	private ITransactionDAO transactionDAO;
	private List<Fund> fundlist;
	private String[] newPrices;
	private String datestring;

	public String gotoTrans(){
		fundlist=fundDAO.findAll();
		return "gototrans";
	}
	public String transact(){
		fundlist=fundDAO.findAll();
		Date date;
		try {
			date = new SimpleDateFormat("yyyy-mm-dd", Locale.US).parse(datestring);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			return "failureTrans";
		}
		List<Transaction> buylist=transactionDAO.findPendingTransaction(date, Transaction.PENDING_BUY);
		List<Transaction> selllist=transactionDAO.findPendingTransaction(date, Transaction.PENDING_SELL);
		List<Transaction> depositlist=transactionDAO.findPendingTransaction(date, Transaction.PENDING_DEPOSIT);
		List<Transaction> withdrawlist=transactionDAO.findPendingTransaction(date, Transaction.PENDING_WITHDRAW);
		if(fundlist.size()!=newPrices.length)
			return "failureTrans";
		List<FundPriceHistory> pricelist=new ArrayList<FundPriceHistory>();
		for(int i=0;i<fundlist.size();i++){
			try{
				FundPriceHistory instance=new FundPriceHistory();
				Long p=Long.valueOf(newPrices[i]);
				instance.setPrice(p);
				FundPriceHistoryId id=new FundPriceHistoryId();
				id.setFund(fundlist.get(i));
				id.setPriceDate(date);
				instance.setId(id);
				pricelist.add(instance);
			}catch(Exception e){
				return "failureTrans";
			}
			
		}
		if(!transactionDAO.transactionDay(buylist, selllist, depositlist, withdrawlist, pricelist))return "failureTrans";
		return "successTrans";
	}
	public List<Fund> getFundlist() {
		return fundlist;
	}

	public void setNewPrices(String[] newPrices) {
		this.newPrices = newPrices;
	}
	public void setFundDAO(IFundDAO fundDAO) {
		this.fundDAO = fundDAO;
	}
	public void setPositionDAO(IPositionDAO positionDAO) {
		this.positionDAO = positionDAO;
	}
	public void setTransactionDAO(ITransactionDAO transactionDAO) {
		this.transactionDAO = transactionDAO;
	}
	public void setDatestring(String datestring) {
		this.datestring = datestring;
	}
}
