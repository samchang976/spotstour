package _02_model.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="receipt_Type")
public class Receipt_TypeBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "receiptTypeId", unique = true, nullable = false)
	private Integer receiptTypeId;
 	private String receiptType;
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
	public Receipt_TypeBean(Integer receiptTypeId, String receiptType) {
		super();
		this.receiptTypeId = receiptTypeId;
		this.receiptType = receiptType;
	}
 	
 	
	
	
}
