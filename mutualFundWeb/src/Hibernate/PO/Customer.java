package Hibernate.PO;

import java.util.HashSet;
import java.util.Set;

/**
 * Customer entity. @author MyEclipse Persistence Tools
 */

public class Customer implements java.io.Serializable {

	// Fields

	private Integer customerId;
	private String username;
	private String password;
	private String firstname;
	private String lastname;
	private String addrLine1;
	private String addrLine2;
	private String city;
	private String state;
	private String zip;
	private Long cash;
	private Long pendingCash;
	private Integer version;
	private Set transactions = new HashSet(0);
	private Set positions = new HashSet(0);

	// Constructors

	/** default constructor */
	public Customer() {
	}

	/** minimal constructor */
	public Customer(String username, String password, String firstname,
			String lastname, String addrLine1, String city, String state,
			String zip, Long cash) {
		this.username = username;
		this.password = password;
		this.firstname = firstname;
		this.lastname = lastname;
		this.addrLine1 = addrLine1;
		this.city = city;
		this.state = state;
		this.zip = zip;
		this.cash = cash;
	}

	/** full constructor */
	public Customer(String username, String password, String firstname,
			String lastname, String addrLine1, String addrLine2, String city,
			String state, String zip, Long cash, Set transactions,
			Set positions) {
		this.username = username;
		this.password = password;
		this.firstname = firstname;
		this.lastname = lastname;
		this.addrLine1 = addrLine1;
		this.addrLine2 = addrLine2;
		this.city = city;
		this.state = state;
		this.zip = zip;
		this.cash = cash;
		this.transactions = transactions;
		this.positions = positions;
	}

	// Property accessors

	public Integer getCustomerId() {
		return this.customerId;
	}

	public void setCustomerId(Integer customerId) {
		this.customerId = customerId;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFirstname() {
		return this.firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return this.lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getAddrLine1() {
		return this.addrLine1;
	}

	public void setAddrLine1(String addrLine1) {
		this.addrLine1 = addrLine1;
	}

	public String getAddrLine2() {
		return this.addrLine2;
	}

	public void setAddrLine2(String addrLine2) {
		this.addrLine2 = addrLine2;
	}

	public String getCity() {
		return this.city;
	}

	public void setCity(String city) {
		this.city = city;
	}



	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getZip() {
		return this.zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

	public Long getCash() {
		return this.cash;
	}

	public void setCash(Long cash) {
		this.cash = cash;
	}

	public Set getTransactions() {
		return this.transactions;
	}

	public void setTransactions(Set transactions) {
		this.transactions = transactions;
	}

	public Set getPositions() {
		return this.positions;
	}

	public void setPositions(Set positions) {
		this.positions = positions;
	}
	public String getCurrentCash(){
		return String.format("%1$,.2f", (double)cash/100);
	}

	public Long getPendingCash() {
		return pendingCash;
	}

	public void setPendingCash(Long pendingCash) {
		this.pendingCash = pendingCash;
	}
	public String getAvailable(){
		return String.format("%1$,.2f", (double)(cash+pendingCash)/100);
	}

	public Integer getVersion() {
		return version;
	}

	public void setVersion(Integer version) {
		this.version = version;
	}

}