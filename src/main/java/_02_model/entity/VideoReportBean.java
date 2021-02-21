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


//@Entity
@Table(name="video_Report")
public class VideoReportBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "report_id", unique = true, nullable = false)
	private Integer reportId;
	@Column(name = "video_id")
	private Integer videoId;
	private String reportText;
	@Column(name = "rt_id")
	private Integer rtId;
	
	@ManyToOne
	@JoinColumn(name="fk_video_id", nullable=false)  
	private VideoBean video;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "rtId")
	private Report_TypeBean report_Type;

	public Integer getReportId() {
		return reportId;
	}

	public void setReportId(Integer reportId) {
		this.reportId = reportId;
	}

	public Integer getVideoId() {
		return videoId;
	}

	public void setVideoId(Integer videoId) {
		this.videoId = videoId;
	}

	public String getReportText() {
		return reportText;
	}

	public void setReportText(String reportText) {
		this.reportText = reportText;
	}

	public Integer getRtId() {
		return rtId;
	}

	public void setRtId(Integer rtId) {
		this.rtId = rtId;
	}

	public VideoBean getVideo() {
		return video;
	}

	public void setVideo(VideoBean video) {
		this.video = video;
	}

	public Report_TypeBean getReport_Type() {
		return report_Type;
	}

	public void setReportType(Report_TypeBean reportType) {
		this.report_Type = reportType;
	}

	public VideoReportBean(Integer reportId, Integer videoId, String reportText, Integer rtId, VideoBean video,
			Report_TypeBean report_Type) {
		super();
		this.reportId = reportId;
		this.videoId = videoId;
		this.reportText = reportText;
		this.rtId = rtId;
		this.video = video;
		this.report_Type = report_Type;
	}
	
	
	
}
