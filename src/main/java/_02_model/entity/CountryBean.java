package _02_model.entity;

import java.io.Serializable;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
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
@Table(name="country")
public class CountryBean implements Serializable{
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int countryId;
	private String countryName;
//	private int continentId;
	@ManyToOne
	@JoinColumn(name = "continentId")
	private ContinentBean continentBean;
	
	@OneToMany(mappedBy = "countryBean" , fetch = FetchType.EAGER)
	private List<CityBean> cityList;
	
	@OneToMany(mappedBy = "countryBean", cascade = CascadeType.ALL)
	private Set<ItemBean> items = new LinkedHashSet<>();

	public int getCountryId() {
		return countryId;
	}

	public void setCountryId(int countryId) {
		this.countryId = countryId;
	}

	public String getCountryName() {
		return countryName;
	}

	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}

	public ContinentBean getContinentBean() {
		return continentBean;
	}

	public void setContinentBean(ContinentBean continentBean) {
		this.continentBean = continentBean;
	}

	public List<CityBean> getCityList() {
		return cityList;
	}

	public void setCityList(List<CityBean> cityList) {
		this.cityList = cityList;
	}
	
	public Set<ItemBean> getItems() {
		return items;
	}

	public void setItems(Set<ItemBean> items) {
		this.items = items;
	}
	
	
}
