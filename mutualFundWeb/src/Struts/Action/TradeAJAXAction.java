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
	public String getHistory(){
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

/*
	public String login(){
		userList=null;
		errorInfo="";
		if(email.length()>0&&password.length()>0){
			if(email.contains("@")&&email.contains(".")){
				ZhenhuawUser u= userDAO.findByProperty("email", email).get(0);
				if(u!=null){
					if(u.getPassword().equals(password)){
						ActionContext ctx=ActionContext.getContext();
						Map<String,Object> session=ctx.getSession();
						session.put("user", u);
						errorInfo="";
						user=new JSONObject();
						user.put("firstName", u.getFirstName());
						user.put("lastName", u.getLastName());
						
					}else{
						errorInfo="Password incorrect!";
					}
					
				}else{
					errorInfo="Email address not existed!";
				}
			}else{
				errorInfo="Email address incorrect!";
			}
		}else{
			errorInfo="Email or password is empty!";
		}
		return Action.SUCCESS;
	}
	public JSONObject getUser() {
		return user;
	}
	public String logout(){
		ActionContext ctx=ActionContext.getContext();
		Map<String,Object> session=ctx.getSession();
		session.clear();
		return Action.SUCCESS;
	}
	public String getUsers(){
		int pagesize=10;
		Integer total=userDAO.count("select count(*) from zhenhuaw_User");
		lastPage=(int) Math.ceil((double)total/(double)pagesize);
		Iterator<ZhenhuawUser> list=userDAO.getListByPage("from ZhenhuawUser", (page-1)*pagesize, pagesize).iterator();
		userList=new JSONArray();
		while(list.hasNext()){
			ZhenhuawUser user=list.next();
			JSONObject u= new JSONObject();
			u.put("firstName", user.getFirstName());
			u.put("lastName", user.getLastName());
			u.put("id", user.getId());
			userList.add(u);
		}
		return Action.SUCCESS;
	}
	public String click(){
		ZhenhuawBookmark b= bookmarkDAO.findByProperty("id", bookmarkID).get(0);
		int click=b.getClickcount();
		click++;
		b.setClickcount(click);
		bookmarkDAO.update(b);
		return Action.SUCCESS;
	}
	
	public Integer getLastPage() {
		return lastPage;
	}
	public String getErrorInfo() {
		return errorInfo;
	}
	public void setBookmarkID(Integer bookmarkID) {
		this.bookmarkID = bookmarkID;
	}
	public JSONArray getUserList() {
		return userList;
	}
	public void setUserDAO(IZhenhuawUserDAO userDAO) {
		this.userDAO = userDAO;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public void setBookmarkDAO(IZhenhuawBookmarkDAO bookmarkDAO) {
		this.bookmarkDAO = bookmarkDAO;
	}
	public Integer getBookmarkID() {
		return bookmarkID;
	}*/
	
	
}
