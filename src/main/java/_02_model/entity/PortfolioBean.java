package _02_model.entity;

import java.io.Serializable;

import java.sql.Timestamp;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;


@Entity
@Table(name="portfolio")
public class PortfolioBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
 	private Integer portfolioId;
	private String portfolioName;
	private String portfolioText;
	private Timestamp p_createTime;
	private String pAddress;
	private String longitude;
	private String latitude;
	
	@OneToMany(mappedBy = "portfolioBean", cascade = { CascadeType.PERSIST }, orphanRemoval = false)
	private Set<RecordBean> records = new LinkedHashSet<>();
	
	@OneToMany(mappedBy = "portfolioBean", cascade = { CascadeType.PERSIST }, orphanRemoval = false)
	private Set<Watch_timesBean> watch_times = new LinkedHashSet<>();
	
	@OneToMany(mappedBy = "portfolioBean" ,cascade = CascadeType.PERSIST)
	private Set<VideoBean> videos = new LinkedHashSet<>();
	
	@ManyToOne 
	@JoinColumn(name="placeTypeId", nullable=false)  
	private Place_TypeBean place_TypeBean; 
	
	@OneToMany(mappedBy = "portfolioBean", cascade = { CascadeType.PERSIST }, orphanRemoval = false)
	private Set<Portfolio_MsgBean> portfolio_Msgs = new LinkedHashSet<>();
	
	@ManyToOne
	@JoinColumn(name="cityId", nullable=false)  
	private CityBean cityBeans;
	
	@ManyToOne
	@JoinColumn(name="mId", nullable=false)
	private MemberBean memberBean;

	public Integer getPortfolioId() {
		return portfolioId;
	}

	public void setPortfolioId(Integer portfolioId) {
		this.portfolioId = portfolioId;
	}

	public String getPortfolioName() {
		return portfolioName;
	}

	public void setPortfolioName(String portfolioName) {
		this.portfolioName = portfolioName;
	}

	public String getPortfolioText() {
		return portfolioText;
	}

	public void setPortfolioText(String portfolioText) {
		this.portfolioText = portfolioText;
	}

	public Timestamp getP_createTime() {
		return p_createTime;
	}

	public void setP_createTime(Timestamp p_createTime) {
		this.p_createTime = p_createTime;
	}

	public String getpAddress() {
		return pAddress;
	}

	public void setpAddress(String pAddress) {
		this.pAddress = pAddress;
	}

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public Set<RecordBean> getRecords() {
		return records;
	}

	public void setRecords(Set<RecordBean> records) {
		this.records = records;
	}

	public Set<Watch_timesBean> getWatch_times() {
		return watch_times;
	}

	public void setWatch_times(Set<Watch_timesBean> watch_times) {
		this.watch_times = watch_times;
	}

	public Set<VideoBean> getVideos() {
		return videos;
	}

	public void setVideos(Set<VideoBean> videos) {
		this.videos = videos;
	}

	public Place_TypeBean getPlace_TypeBean() {
		return place_TypeBean;
	}

	public void setPlace_TypeBean(Place_TypeBean place_TypeBean) {
		this.place_TypeBean = place_TypeBean;
	}

	public Set<Portfolio_MsgBean> getPortfolio_Msgs() {
		return portfolio_Msgs;
	}

	public void setPortfolio_Msgs(Set<Portfolio_MsgBean> portfolio_Msgs) {
		this.portfolio_Msgs = portfolio_Msgs;
	}

	public CityBean getCityBeans() {
		return cityBeans;
	}

	public void setCityBeans(CityBean cityBeans) {
		this.cityBeans = cityBeans;
	}

	public MemberBean getMemberBean() {
		return memberBean;
	}

	public void setMemberBean(MemberBean memberBean) {
		this.memberBean = memberBean;
	}


	
}	
