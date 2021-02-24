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


//@Entity
@Table(name="place_type")
public class Place_TypeBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "placeTypeId", unique = true, nullable = false)
	Integer placeTypeId;
 	String placeType;
 	
 	@OneToMany(mappedBy = "placeType", cascade = { CascadeType.PERSIST }, orphanRemoval = false)
 	private Set<PorfolioBean> porfolioes = new LinkedHashSet<>();

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

	public Set<PorfolioBean> getPorfolioes() {
		return porfolioes;
	}

	public void setPorfolioes(Set<PorfolioBean> porfolioes) {
		this.porfolioes = porfolioes;
	}

	public Place_TypeBean(Integer placeTypeId, String placeType, Set<PorfolioBean> porfolioes) {
		super();
		this.placeTypeId = placeTypeId;
		this.placeType = placeType;
		this.porfolioes = porfolioes;
	}
	
}
