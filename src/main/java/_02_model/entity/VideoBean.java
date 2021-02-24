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
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;


//@Entity
@Table(name="video")
public class VideoBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "videoId", unique = true, nullable = false)
	private Integer videoId;
	private Blob videoFile;
	private Blob videoPic;
	@Column(name = "portfolioId")
	private Integer portfolioId;  
	private Blob v_freeze;
	
	@OneToMany(mappedBy = "videoBean", cascade = { CascadeType.PERSIST }, orphanRemoval = false)
	private Set<VideoReportBean> videoReports = new LinkedHashSet<>();
	
	@OneToOne(mappedBy="VideoBean")
	private PorfolioBean profolio;

	public Integer getVideoId() {
		return videoId;
	}

	public void setVideoId(Integer videoId) {
		this.videoId = videoId;
	}

	public Blob getVideoFile() {
		return videoFile;
	}

	public void setVideoFile(Blob videoFile) {
		this.videoFile = videoFile;
	}

	public Blob getVideoPic() {
		return videoPic;
	}

	public void setVideoPic(Blob videoPic) {
		this.videoPic = videoPic;
	}

	public Integer getPortfolioId() {
		return portfolioId;
	}

	public void setPortfolioId(Integer portfolioId) {
		this.portfolioId = portfolioId;
	}

	public Blob getV_freeze() {
		return v_freeze;
	}

	public void setV_freeze(Blob v_freeze) {
		this.v_freeze = v_freeze;
	}

	public Set<VideoReportBean> getVideoReports() {
		return videoReports;
	}

	public void setVideoReports(Set<VideoReportBean> videoReports) {
		this.videoReports = videoReports;
	}

	public PorfolioBean getProfolio() {
		return profolio;
	}

	public void setProfolio(PorfolioBean profolio) {
		this.profolio = profolio;
	}

	public VideoBean(Integer videoId, Blob videoFile, Blob videoPic, Integer portfolioId, Blob v_freeze,
			Set<VideoReportBean> videoReports, PorfolioBean profolio) {
		super();
		this.videoId = videoId;
		this.videoFile = videoFile;
		this.videoPic = videoPic;
		this.portfolioId = portfolioId;
		this.v_freeze = v_freeze;
		this.videoReports = videoReports;
		this.profolio = profolio;
	}
	
	
}
