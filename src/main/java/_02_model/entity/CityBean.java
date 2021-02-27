package _02_model.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="city")
public class CityBean implements Serializable{
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int cityId;
	private String cityName;
	
	@ManyToOne
	@JoinColumn(name = "countryId")
	private CountryBean countryBean;
	
	@OneToMany(mappedBy = "cityBeans" , fetch = FetchType.EAGER)
	private List<PorfolioBean> porfolioBeans;

	public int getCityId() {
		return cityId;
	}

	public void setCityId(int cityId) {
		this.cityId = cityId;
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public CountryBean getCountryBean() {
		return countryBean;
	}

	public void setCountryBean(CountryBean countryBean) {
		this.countryBean = countryBean;
	}

	public List<PorfolioBean> getPorfolioBeans() {
		return porfolioBeans;
	}

	public void setPorfolioBeans(List<PorfolioBean> porfolioBeans) {
		this.porfolioBeans = porfolioBeans;
	}


	
}
