package _02_model.entity;

import java.io.Serializable;
import java.util.HashSet;
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
@Table(name="params")
public class ParamsBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "type", unique = true, nullable = false)	
	private String type;
	private String typeName;
	
	@OneToMany(mappedBy = "ParamsBean", cascade = CascadeType.ALL)
	Set<ParamsBean> set = new HashSet<>();

	public ParamsBean(String type, String typeName, Set<ParamsBean> set) {
		super();
		this.type = type;
		this.typeName = typeName;
		this.set = set;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public Set<ParamsBean> getSet() {
		return set;
	}

	public void setSet(Set<ParamsBean> set) {
		this.set = set;
	}
	
	
	
	
}
