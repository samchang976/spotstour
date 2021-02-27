package _02_model.entity;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="feedback")
public class FeedbackBean implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer feedbackId;
	private String feedbackText;            
	private Timestamp f_createTime;	
	@Transient
	private Integer itemTId;  //確認
	private Integer fb_freeze;
	
	@ManyToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "itemId")
	private ItemBean itemBean;

	public Integer getFeedbackId() {
		return feedbackId;
	}

	public void setFeedbackId(Integer feedbackId) {
		this.feedbackId = feedbackId;
	}

	public String getFeedbackText() {
		return feedbackText;
	}

	public void setFeedbackText(String feedbackText) {
		this.feedbackText = feedbackText;
	}

	public Timestamp getF_createTime() {
		return f_createTime;
	}

	public void setF_createTime(Timestamp f_createTime) {
		this.f_createTime = f_createTime;
	}

	public Integer getItemTId() {
		return itemTId;
	}

	public void setItemTId(Integer itemTId) {
		this.itemTId = itemTId;
	}

	public Integer getFb_freeze() {
		return fb_freeze;
	}

	public void setFb_freeze(Integer fb_freeze) {
		this.fb_freeze = fb_freeze;
	}

	public ItemBean getItemBean() {
		return itemBean;
	}

	public void setItemBean(ItemBean itemBean) {
		this.itemBean = itemBean;
	}
	

	
}
