package Struts.Action;



import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Set;



import net.sf.json.JSONArray;
import net.sf.json.JSONObject;




import Hibernate.DAO.IFundDAO;
import Hibernate.DAO.IFundPriceHistoryDAO;
import Hibernate.PO.Fund;
import Hibernate.PO.FundPriceHistory;


import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class TradeAJAXAction extends ActionSupport{


	private JSONArray historyList;
	
	private IFundDAO fundDAO;
	private IFundPriceHistoryDAO fundPriceHistoryDAO;
	private Integer fundId;
	private String keywords;
	private JSONArray fundnameList;
	public String findHistory(){
		try{
		historyList=new JSONArray();
		Fund fund=fundDAO.findById(fundId);
		List<FundPriceHistory> list=fundPriceHistoryDAO.findByProperty("id.fund", fund);

		Iterator<FundPriceHistory> i=list.iterator();
		
		while(i.hasNext()){
			FundPriceHistory f= i.next();
			JSONObject d= new JSONObject();
			d.put("time", f.getId().getPriceDate().getTime());
			d.put("price",(double)f.getPrice()/100);
			historyList.add(d);
			
		}
		}catch(Exception e){
			e.printStackTrace();
		}
		return Action.SUCCESS;
	}
	public String autoCompleteSearch(){
		List<Fund> list=fundDAO.autoCompleteSearch(keywords);
		fundnameList=new JSONArray();
		for(Fund f:list){
			String name=f.getName()+" ("+f.getSymbol()+")";
			fundnameList.add(name);
		}
		return Action.SUCCESS;
	}
	public JSONArray getHistoryList() {
		return historyList;
	}
	public void setFundDAO(IFundDAO fundDAO) {
		this.fundDAO = fundDAO;
	}
	public void setFundId(Integer fundId) {
		this.fundId = fundId;
	}
	public void setFundPriceHistoryDAO(IFundPriceHistoryDAO fundPriceHistoryDAO) {
		this.fundPriceHistoryDAO = fundPriceHistoryDAO;
	}
	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}
	public JSONArray getFundnameList() {
		return fundnameList;
	}


	
	
}
