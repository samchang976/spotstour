package _02_model.entity;

import java.io.Serializable;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name="place_Type")
public class Place_TypeBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer placeTypeId;
 	String placeType;
 	
 	@OneToMany(mappedBy = "place_TypeBean", cascade = { CascadeType.PERSIST }, orphanRemoval = false)
 	private Set<PorfolioBean> porfolioBeans = new LinkedHashSet<>();

	public Integer getPlaceTypeId() {
		return placeTypeId;
	}

	public void setPlaceTypeId(Integer placeTypeId) {
		this.placeTypeId = placeTypeId;
	}

	public String getPlaceType() {
		return placeType;
	}

	public void setPlaceType(String placeType) {
		this.placeType = placeType;
	}

	public Set<PorfolioBean> getPorfolioBeans() {
		return porfolioBeans;
	}

	public void setPorfolioBeans(Set<PorfolioBean> porfolioBeans) {
		this.porfolioBeans = porfolioBeans;
	}


	
}
