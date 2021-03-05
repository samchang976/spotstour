package _02_model.entity;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="activity")
public class ActivityBean implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer activityId;
	private String activityHeader;
	private String activityContent;
	private Integer activity_freeze;
	private Date activity_createTime;	
	
	
	public ActivityBean() {
		super();
	}

	public ActivityBean(Integer activityId, String activityHeader, String activityContent, Integer activity_freeze,
			Date activity_createTime) {
		super();
		this.activityId = activityId;
		this.activityHeader = activityHeader;
		this.activityContent = activityContent;
		this.activity_freeze = activity_freeze;
		this.activity_createTime = activity_createTime;
	}

	public Integer getActivityId() {
		return activityId;
	}
	
	public void setActivityId(Integer activityId) {
		this.activityId = activityId;
	}
	
	public String getActivityHeader() {
		return activityHeader;
	}
	
	public void setActivityHeader(String activityHeader) {
		this.activityHeader = activityHeader;
	}
	
	public String getActivityContent() {
		return activityContent;
	}
	
	public void setActivityContent(String activityContent) {
		this.activityContent = activityContent;
	}
	
	public Integer getActivity_freeze() {
		return activity_freeze;
	}
	
	public void setActivity_freeze(Integer activity_freeze) {
		this.activity_freeze = activity_freeze;
	}

	public Date getActivity_createTime() {
		return activity_createTime;
	}

	public void setActivity_createTime(Date activity_createTime) {
		this.activity_createTime = activity_createTime;
	}

}
