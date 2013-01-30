package Hibernate.PO;

import java.util.HashSet;
import java.util.Set;

/**
 * Position entity. @author MyEclipse Persistence Tools
 */

public class Position implements java.io.Serializable {

	// Fields

	private PositionId id;
	private Long shares;
	private Set transactions = new HashSet(0);
	private Long pendingShare;
	private Integer version;
	// Constructors

	/** default constructor */
	public Position() {
	}

	/** minimal constructor */
	public Position(PositionId id) {
		this.id = id;
	}

	/** full constructor */
	public Position(PositionId id, Long shares, Set transactions) {
		this.id = id;
		this.shares = shares;
		this.transactions = transactions;
	}

	// Property accessors

	public PositionId getId() {
		return this.id;
	}

	public void setId(PositionId id) {
		this.id = id;
	}

	public Long getShares() {
		return this.shares;
	}

	public void setShares(Long shares) {
		this.shares = shares;
	}

	public Set getTransactions() {
		return this.transactions;
	}

	public void setTransactions(Set transactions) {
		this.transactions = transactions;
	}
	public String getCurrentShares(){
		return String.format("%1$,.3f", (double)shares/1000);
	}


	public Long getPendingShare() {
		return pendingShare;
	}

	public void setPendingShare(Long pendingShare) {
		this.pendingShare = pendingShare;
	}

	public String getAvailable(){
		
		return String.format("%1$,.3f", (double)(shares-pendingShare)/1000);
	}

	public Integer getVersion() {
		return version;
	}

	public void setVersion(Integer version) {
		this.version = version;
	}

	
}