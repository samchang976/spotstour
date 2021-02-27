package _02_model.entity;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name="video_report")
public class VideoReportBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer reportId;
	private String reportText;
	
	@ManyToOne
	@JoinColumn(name="videoId", nullable=false)  
	private VideoBean videoBeans;
	
	@ManyToOne
	@JoinColumn(name = "rtId")
	private Report_TypeBean reportTypeBeans;

	public Integer getReportId() {
		return reportId;
	}

	public void setReportId(Integer reportId) {
		this.reportId = reportId;
	}

	public String getReportText() {
		return reportText;
	}

	public void setReportText(String reportText) {
		this.reportText = reportText;
	}

	public VideoBean getVideoBeans() {
		return videoBeans;
	}

	public void setVideoBeans(VideoBean videoBeans) {
		this.videoBeans = videoBeans;
	}

	public Report_TypeBean getReportTypeBeans() {
		return reportTypeBeans;
	}

	public void setReportTypeBeans(Report_TypeBean reportTypeBeans) {
		this.reportTypeBeans = reportTypeBeans;
	}


}
