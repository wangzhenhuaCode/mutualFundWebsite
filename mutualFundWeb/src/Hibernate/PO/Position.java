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

}