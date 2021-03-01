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
	private Integer paramId;
	private String type;
	private String typeName;
	
	@OneToMany(mappedBy = "paramsBean", cascade = CascadeType.ALL)
	Set<RecordBean> recordBeans = new HashSet<>();

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

	public Set<RecordBean> getRecordBeans() {
		return recordBeans;
	}

	public void setRecordBeans(Set<RecordBean> recordBeans) {
		this.recordBeans = recordBeans;
	}


	
	
}
