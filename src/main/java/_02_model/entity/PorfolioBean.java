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


//@Entity
@Table(name="porfolio")
public class PorfolioBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "portfolioId", unique = true, nullable = false)
 	private Integer portfolioId;
	@Column(name="cityId")
	private Integer cityId;
	private String portfolioName;
	private String portfolioText;
	@Column(name="placeTypeId")
	private Integer placeTypeId;
	private Timestamp p_createTime;
	@Column(name="mid")
	private Integer mId;
	private String pAddress;
	private Float longitude;
	private Float latitude;
	
	@OneToMany(mappedBy = "porfolio", cascade = { CascadeType.PERSIST }, orphanRemoval = false)
	private Set<RecordBean> records = new LinkedHashSet<>();
	
	@OneToMany(mappedBy = "porfolio", cascade = { CascadeType.PERSIST }, orphanRemoval = false)
	private Set<Watch_timesBean> watch_times = new LinkedHashSet<>();
	
	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "fk_video_id")
	private VideoBean video;
	
	@ManyToOne 
	@JoinColumn(name="fk_placeType_id", nullable=false)  
	private Place_TypeBean place_Type; 
	
	@OneToMany(mappedBy = "porfolio", cascade = { CascadeType.PERSIST }, orphanRemoval = false)
	private Set<Porfolio_MsgBean> portfolio_Msgs = new LinkedHashSet<>();
	
	@ManyToOne
	@JoinColumn(name="fk_city_id", nullable=false)  
	private CityBean city;
	
	@ManyToOne
	@JoinColumn(name="mid", nullable=false)
	private MemberBean member;

	public Integer getPortfolioId() {
		return portfolioId;
	}

	public void setPortfolioId(Integer portfolioId) {
		this.portfolioId = portfolioId;
	}

	public Integer getCityId() {
		return cityId;
	}

	public void setCityId(Integer cityId) {
		this.cityId = cityId;
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

	public Integer getPlaceTypeId() {
		return placeTypeId;
	}

	public void setPlaceTypeId(Integer placeTypeId) {
		this.placeTypeId = placeTypeId;
	}

	public Timestamp getP_createTime() {
		return p_createTime;
	}

	public void setP_createTime(Timestamp p_createTime) {
		this.p_createTime = p_createTime;
	}

	public Integer getmId() {
		return mId;
	}

	public void setmId(Integer mId) {
		this.mId = mId;
	}

	public String getpAddress() {
		return pAddress;
	}

	public void setpAddress(String pAddress) {
		this.pAddress = pAddress;
	}

	public Float getLongitude() {
		return longitude;
	}

	public void setLongitude(Float longitude) {
		this.longitude = longitude;
	}

	public Float getLatitude() {
		return latitude;
	}

	public void setLatitude(Float latitude) {
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

	public VideoBean getVideo() {
		return video;
	}

	public void setVideo(VideoBean video) {
		this.video = video;
	}

	public Place_TypeBean getPlace_Type() {
		return place_Type;
	}

	public void setPlace_Type(Place_TypeBean place_Type) {
		this.place_Type = place_Type;
	}

	public Set<Porfolio_MsgBean> getPortfolio_Msgs() {
		return portfolio_Msgs;
	}

	public void setPortfolio_Msgs(Set<Porfolio_MsgBean> portfolio_Msgs) {
		this.portfolio_Msgs = portfolio_Msgs;
	}

	public CityBean getCity() {
		return city;
	}

	public void setCity(CityBean city) {
		this.city = city;
	}

	public MemberBean getMember() {
		return member;
	}

	public void setMember(MemberBean member) {
		this.member = member;
	}

	public PorfolioBean(Integer portfolioId, Integer cityId, String portfolioName, String portfolioText,
			Integer placeTypeId, Timestamp p_createTime, Integer mId, String pAddress, Float longitude, Float latitude,
			Set<RecordBean> records, Set<Watch_timesBean> watch_times, VideoBean video, Place_TypeBean place_Type,
			Set<Porfolio_MsgBean> portfolio_Msgs, CityBean city, MemberBean member) {
		super();
		this.portfolioId = portfolioId;
		this.cityId = cityId;
		this.portfolioName = portfolioName;
		this.portfolioText = portfolioText;
		this.placeTypeId = placeTypeId;
		this.p_createTime = p_createTime;
		this.mId = mId;
		this.pAddress = pAddress;
		this.longitude = longitude;
		this.latitude = latitude;
		this.records = records;
		this.watch_times = watch_times;
		this.video = video;
		this.place_Type = place_Type;
		this.portfolio_Msgs = portfolio_Msgs;
		this.city = city;
		this.member = member;
	}
	
	
	
}	
