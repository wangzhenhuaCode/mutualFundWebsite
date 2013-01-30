package Hibernate.PO;

/**
 * FundPriceHistory entity. @author MyEclipse Persistence Tools
 */

public class FundPriceHistory implements java.io.Serializable {

	// Fields

	private FundPriceHistoryId id;
	private Long price;
	private Integer version;
	// Constructors

	/** default constructor */
	public FundPriceHistory() {
	}

	/** full constructor */
	public FundPriceHistory(FundPriceHistoryId id, Long price) {
		this.id = id;
		this.price = price;
	}

	// Property accessors

	public FundPriceHistoryId getId() {
		return this.id;
	}

	public void setId(FundPriceHistoryId id) {
		this.id = id;
	}

	public Long getPrice() {
		return this.price;
	}

	public void setPrice(Long price) {
		this.price = price;
	}

	public Integer getVersion() {
		return version;
	}

	public void setVersion(Integer version) {
		this.version = version;
	}

}