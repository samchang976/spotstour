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

//@Entity
@Table(name="feedback")
public class FeedbackBean implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer feedbackId;
	private String feedbackText;            
	private Timestamp f_createTime;
	
	@Transient
	private Integer itemId;
	
	@Column(columnDefinition = "INT Default 1")
	private Boolean fb_freeze;
	
	@ManyToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "itemId")
	private ItemBean itemBean;
	
	public FeedbackBean() {
		super();
	}

	public FeedbackBean(Integer feedbackId, Integer itemId, String feedbackText, Timestamp f_createTime, Boolean fb_freeze,
			ItemBean itemBean) {
		super();
		this.feedbackId = feedbackId;
		this.itemId = itemId;
		this.feedbackText = feedbackText;
		this.f_createTime = f_createTime;
		this.fb_freeze = fb_freeze;
		this.itemBean = itemBean;
	}
	
	public Integer getFeedbackId() {
		return feedbackId;
	}
	
	public void setFeedbackId(Integer feedbackId) {
		this.feedbackId = feedbackId;
	}
	
	public Integer getItemId() {
		return itemId;
	}
	
	public void setItemId(Integer itemId) {
		this.itemId = itemId;
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

	public Boolean getFb_freeze() {
		return fb_freeze;
	}

	public void setFb_freeze(Boolean fb_freeze) {
		this.fb_freeze = fb_freeze;
	}

	public ItemBean getItemBean() {
		return itemBean;
	}

	public void setItemBean(ItemBean itemBean) {
		this.itemBean = itemBean;
	}

	
}
