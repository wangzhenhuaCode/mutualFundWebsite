package Hibernate.PO;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Transaction entity. @author MyEclipse Persistence Tools
 */

public class Transaction implements java.io.Serializable {
	public static Integer SELLED=1;
	public static Integer BOUGHT=3;
	public static Integer PENDING_SELL=2;
	public static Integer PENDING_BUY=4;
	public static Integer DEPOSITED=5;
	public static Integer PENDING_DEPOSIT=6;
	public static Integer WITHDRAW=7;
	public static Integer PENDING_WITHDRAW=8;
	// Fields

	private Integer transactionId;
	private Fund fund;
	private Customer customer;
	private Position position;
	private Date executeDate;
	private Long shares;
	private Integer transactionType;
	private Long amount;
	private Integer version;
	// Constructors

	/** default constructor */
	public Transaction() {
	}
	
	/** minimal constructor */
	public Transaction(Customer customer, Position position, Date executeDate,
			Integer transactionType) {
		this.customer = customer;
		this.position = position;
		this.executeDate = executeDate;
		this.transactionType = transactionType;
	}

	/** full constructor */
	public Transaction(Fund fund, Customer customer, Position position,
			Date executeDate, Long shares, Integer transactionType, Long amount) {
		this.fund = fund;
		this.customer = customer;
		this.position = position;
		this.executeDate = executeDate;
		this.shares = shares;
		this.transactionType = transactionType;
		this.amount = amount;
	}

	// Property accessors

	public Integer getTransactionId() {
		return this.transactionId;
	}

	public void setTransactionId(Integer transactionId) {
		this.transactionId = transactionId;
	}

	public Fund getFund() {
		return this.fund;
	}

	public void setFund(Fund fund) {
		this.fund = fund;
	}

	public Customer getCustomer() {
		return this.customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public Position getPosition() {
		return this.position;
	}

	public void setPosition(Position position) {
		this.position = position;
	}

	public Date getExecuteDate() {
		return this.executeDate;
	}

	public void setExecuteDate(Date executeDate) {
		this.executeDate = executeDate;
	}

	public Long getShares() {
		return this.shares;
	}

	public void setShares(Long shares) {
		this.shares = shares;
	}

	public Integer getTransactionType() {
		return this.transactionType;
	}

	public void setTransactionType(Integer transactionType) {
		this.transactionType = transactionType;
	}

	public Long getAmount() {
		return this.amount;
	}

	public void setAmount(Long amount) {
		this.amount = amount;
	}
	public String getBoughtPrice(){
		
		if(transactionType%2==0 )return "-";
		if(transactionType>4)return "-";
		Double p=Math.abs(((double)amount/100)/((double)shares/1000));
		return String.format("%1$,.2f", p);
	}
	public String getCurrentShares(){
		if(transactionType%2==0 &&transactionType!=2)return "-";
		if(transactionType>4)return "-";
		return String.format("%1$,.3f", (double)shares/1000);
	}
	public String getCurrentAmount(){
		if(transactionType==2)return "-";
		
		return String.format("%1$,.2f", (double)amount/100);
	}
	public String getCurrentDate(){
		SimpleDateFormat sdf=new SimpleDateFormat("MMM dd, yyyy");
		return sdf.format(executeDate);
	}

	public Integer getVersion() {
		return version;
	}

	public void setVersion(Integer version) {
		this.version = version;
	}
}