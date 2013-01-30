package Hibernate.PO;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

/**
 * Fund entity. @author MyEclipse Persistence Tools
 */

public class Fund implements java.io.Serializable {

	// Fields

	private Integer fundId;
	private String name;
	private String symbol;
	private String description;
	private Set positions = new HashSet(0);
	private Set fundPriceHistories = new HashSet(0);
	private Set transactions = new HashSet(0);
	private Integer version;
	
	private Long todayPrice;
	private Double percentage;
	// Constructors

	/** default constructor */
	public Fund() {
	}

	/** minimal constructor */
	public Fund(String name, String symbol) {
		this.name = name;
		this.symbol = symbol;
	}

	/** full constructor */
	public Fund(String name, String symbol, String description, Set positions,
			Set fundPriceHistories, Set transactions) {
		this.name = name;
		this.symbol = symbol;
		this.description = description;
		this.positions = positions;
		this.fundPriceHistories = fundPriceHistories;
		this.transactions = transactions;
	}

	// Property accessors

	public Integer getFundId() {
		return this.fundId;
	}

	public void setFundId(Integer fundId) {
		this.fundId = fundId;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSymbol() {
		return this.symbol;
	}

	public void setSymbol(String symbol) {
		this.symbol = symbol;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Set getPositions() {
		return this.positions;
	}

	public void setPositions(Set positions) {
		this.positions = positions;
	}

	public Set getFundPriceHistories() {
		return this.fundPriceHistories;
	}

	public void setFundPriceHistories(Set fundPriceHistories) {
		this.fundPriceHistories = fundPriceHistories;
	}

	public Set getTransactions() {
		return this.transactions;
	}

	public void setTransactions(Set transactions) {
		this.transactions = transactions;
	}
	public String getPercentage(){
		if(percentage==null){
			
			if(fundPriceHistories.size()>1){
				Iterator i=fundPriceHistories.iterator();
				todayPrice=((FundPriceHistory)i.next()).getPrice();
				
					Long p=((FundPriceHistory)i.next()).getPrice();
					percentage=((double)todayPrice-(double)p)/(double)p*100;
					return String.format("%1$,.2f", percentage);
				
			}else return null;
		}else return String.format("%1$,.2f", percentage);
	}

	public String getTodayPrice() {
		if(todayPrice==null){
			
			if(this.getFundPriceHistories().size()>0){
				Iterator i=this.getFundPriceHistories().iterator();
				todayPrice=((FundPriceHistory)i.next()).getPrice();
				Double coverted=(double)todayPrice/100;
				return String.format("%1$,.2f", coverted);
			}else
				return null;
		}
		else{
			Double coverted=(double)todayPrice/100;
			return String.format("%1$,.2f", coverted);
		}
	}

	public Integer getVersion() {
		return version;
	}

	public void setVersion(Integer version) {
		this.version = version;
	}

}