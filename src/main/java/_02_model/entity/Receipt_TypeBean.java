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
@Table(name="receipt_Type")
public class Receipt_TypeBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer receiptTypeId;
 	private String receiptType;
 	
	@OneToMany(mappedBy = "receiptTypeBean", cascade = CascadeType.ALL)
	private Set<OrdBean> ordBeans = new LinkedHashSet<>();

	public Integer getReceiptTypeId() {
		return receiptTypeId;
	}

	public void setReceiptTypeId(Integer receiptTypeId) {
		this.receiptTypeId = receiptTypeId;
	}

	public String getReceiptType() {
		return receiptType;
	}

	public void setReceiptType(String receiptType) {
		this.receiptType = receiptType;
	}

	public Set<OrdBean> getOrdBeans() {
		return ordBeans;
	}

	public void setOrdBeans(Set<OrdBean> ordBeans) {
		this.ordBeans = ordBeans;
	}
	
	
}
