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
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name="report_Type")
public class Report_TypeBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "rtId", unique = true, nullable = false)
	private Integer rtId;
 	private String reportType;
	
 	@OneToMany(cascade = CascadeType.PERSIST, orphanRemoval = true)
 	@JoinColumn(name = "rtId", referencedColumnName = "rtId")
 	private Set<VideoBean> videos = new LinkedHashSet<>();

	public Integer getRtId() {
		return rtId;
	}

	public void setRtId(Integer rtId) {
		this.rtId = rtId;
	}

	public String getReportType() {
		return reportType;
	}

	public void setReportType(String reportType) {
		this.reportType = reportType;
	}

	public Set<VideoBean> getVideos() {
		return videos;
	}

	public void setVideos(Set<VideoBean> videos) {
		this.videos = videos;
	}

	public Report_TypeBean(Integer rtId, String reportType, Set<VideoBean> videos) {
		super();
		this.rtId = rtId;
		this.reportType = reportType;
		this.videos = videos;
	}
 	
 	
}
