package _02_model.entity;

import java.io.Serializable;
import java.sql.Blob;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "video")
public class VideoBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer videoId;
	private String videoFile;
	private String videoPic;
	private int v_freeze;

	@OneToMany(mappedBy = "videoBeans", cascade = { CascadeType.PERSIST }, orphanRemoval = false)
	private Set<VideoReportBean> videoReports = new LinkedHashSet<>();

	@ManyToOne
	@JoinColumn(name = "portfolioId")
	private PortfolioBean portfolioBean;

	public Integer getVideoId() {
		return videoId;
	}

	public void setVideoId(Integer videoId) {
		this.videoId = videoId;
	}

	public String getVideoFile() {
		return videoFile;
	}

	public void setVideoFile(String videoFile) {
		this.videoFile = videoFile;
	}

	public String getVideoPic() {
		return videoPic;
	}

	public void setVideoPic(String videoPic) {
		this.videoPic = videoPic;
	}

	public int getV_freeze() {
		return v_freeze;
	}

	public void setV_freeze(int v_freeze) {
		this.v_freeze = v_freeze;
	}

	public Set<VideoReportBean> getVideoReports() {
		return videoReports;
	}

	public void setVideoReports(Set<VideoReportBean> videoReports) {
		this.videoReports = videoReports;
	}

	public PortfolioBean getPortfolioBean() {
		return portfolioBean;
	}

	public void setPortfolioBean(PortfolioBean portfolioBean) {
		this.portfolioBean = portfolioBean;
	}

}
