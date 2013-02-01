package Struts.Action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import Hibernate.DAO.IFundDAO;
import Hibernate.DAO.IPositionDAO;
import Hibernate.DAO.ITransactionDAO;
import Hibernate.PO.Fund;
import Hibernate.PO.FundPriceHistory;
import Hibernate.PO.FundPriceHistoryId;
import Hibernate.PO.Transaction;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class TransactionDayAction extends ActionSupport{
	private IFundDAO fundDAO;
	private IPositionDAO positionDAO;
	private ITransactionDAO transactionDAO;
	private List<Fund> fundlist;
	private String[] newPrices;
	private String datestring;
	private String errorInfo;
	public String gotoTrans(){
		fundlist=fundDAO.findAll();
		errorInfo="";
		return "gototrans";
	}
	public String transact(){
		ActionContext ctx=ActionContext.getContext();
		Map<String,Object> application=ctx.getApplication();
		if(application.containsKey("application")){
			if(application.get("application").equals("true")){
				errorInfo="System busy!";
				return "failureTrans";
			}
		}
		application.put("transitionLock", true);
		errorInfo="";
		fundlist=fundDAO.findAll();
		Date date;
		try {
			date = (new SimpleDateFormat("yyyy-MM-dd")).parse(datestring);
		} catch (ParseException e1) {
			errorInfo="Wrong time format!";
			return "failureTrans";
		}
		List<Transaction> buylist=transactionDAO.findPendingTransaction(date, Transaction.PENDING_BUY);
		List<Transaction> selllist=transactionDAO.findPendingTransaction(date, Transaction.PENDING_SELL);
		List<Transaction> depositlist=transactionDAO.findPendingTransaction(date, Transaction.PENDING_DEPOSIT);
		List<Transaction> withdrawlist=transactionDAO.findPendingTransaction(date, Transaction.PENDING_WITHDRAW);
		if(fundlist.size()!=newPrices.length){
			errorInfo="Please fill price for all funds";
			return "failureTrans";}
		List<FundPriceHistory> pricelist=new ArrayList<FundPriceHistory>();
		for(int i=0;i<fundlist.size();i++){
			FundPriceHistory instance;
			Long p;
			try{
				instance=new FundPriceHistory();
				p=(long)(Math.round(Double.valueOf(newPrices[i])*100));
				if(p>Transaction.MAX_TRANSACTION_AMOUNT){
					errorInfo="price should be less than 1 billion";
					return "failureTrans";
				}
			}catch(Exception e){
				errorInfo="Please fill price for all funds with valid price";
				return "failureTrans";
			}
				instance.setPrice(p);
				FundPriceHistoryId id=new FundPriceHistoryId();
				id.setFund(fundlist.get(i));
				id.setPriceDate(date);
				instance.setId(id);
				pricelist.add(instance);
			
			
		}
		if(!transactionDAO.transactionDay(buylist, selllist, depositlist, withdrawlist, pricelist,date)){
			errorInfo="Repeated transition day";
			return "failureTrans";
		}
		application.put("transitionLock", false);
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
	public String getErrorInfo() {
		return errorInfo;
	}
}
