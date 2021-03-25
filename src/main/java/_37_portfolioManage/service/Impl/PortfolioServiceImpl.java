package _37_portfolioManage.service.Impl;

import java.io.IOException;
import java.util.UUID;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import _00_util.DateTimeUtils;
import _00_util.StreamUtils;
import _02_model.entity.CityBean;
import _02_model.entity.MemberBean;
import _02_model.entity.Place_TypeBean;
import _02_model.entity.PortfolioBean;
import _02_model.entity.VideoBean;
import _37_portfolioManage.controller.vo.PortfolioBeanVo;
import _37_portfolioManage.dao.PortfolioDao;
import _37_portfolioManage.dao.VideoDao;
import _37_portfolioManage.dao.CityDao;
import _37_portfolioManage.dao.MemberDao;
import _37_portfolioManage.dao.Place_TypeDao;
import _37_portfolioManage.service.PortfolioService;

@Service
public class PortfolioServiceImpl implements PortfolioService {

	@Autowired
	private PortfolioDao portfolioDao;
	@Autowired
	private MemberDao MemberDao;
	@Autowired
	private Place_TypeDao place_TypeDao;
	@Autowired
	private CityDao cityDao;
	@Autowired
	private VideoDao videoDao;

	
	@Transactional
	@Override
	public void addPortfolio(PortfolioBeanVo portfolioBeanVo) throws IOException {
		//準備一個對應資料庫作品的Bean
		PortfolioBean portfolioBean = new PortfolioBean();
		portfolioBean.setPortfolioName(portfolioBeanVo.getPortfolioName());
		portfolioBean.setP_createTime(DateTimeUtils.getTimestamps());
		portfolioBean.setpAddress(portfolioBeanVo.getpAddress());
		portfolioBean.setLatitude(portfolioBeanVo.getLatitude());
		portfolioBean.setLongitude(portfolioBeanVo.getLongitude());
		portfolioBean.setPortfolioText(portfolioBeanVo.getPortfolioText());
		//關聯會員的row
		Integer imId = portfolioBeanVo.getmId();
		MemberBean mb = MemberDao.getMemberById(imId);
		portfolioBean.setMemberBean(mb);
		//關聯地點類型的row
		Integer iptId = portfolioBeanVo.getPlaceTypeId();
		Place_TypeBean pt = place_TypeDao.getPlace_TypeById(iptId);
		portfolioBean.setPlace_TypeBean(pt);
		//關聯城市的row
		Integer icId = portfolioBeanVo.getCityId();
		CityBean cb = cityDao.getCityById(icId);
		portfolioBean.setCityBeans(cb);
		//新增作品
		portfolioDao.addPortfolio(portfolioBean);
		//===================================================================
		//準備一個對應資料庫影片的Bean
		VideoBean videoBean = new VideoBean();
		//凍結預設0 (不凍結)
		videoBean.setV_freeze(0);
		//關聯作品的row
		videoBean.setPortfolioBean(portfolioBean);
		//將接取的圖片檔案儲存到本地,拿取路徑字串,放入要送到對應資料庫圖片的Bean
		MultipartFile mfp = portfolioBeanVo.getVideoPic();
		//隨機唯一圖片檔名
		UUID puuid = UUID.randomUUID();
//		String picPath = "/Project/workspace_JSP/SpotsTourHSM/src/main/webapp/images/vedioImages/";
		String picPath = "/_Hibernate/workspace/SpotsTourHSM/src/main/webapp/images/vedioImages/";
		String picName = puuid + ".jpg";
//		videoBean.setVideoPic((StreamUtils.writeStream(mfp.getBytes(),picPath,picName)).substring(58));	
		videoBean.setVideoPic((StreamUtils.writeStream(mfp.getBytes(),picPath,picName)).substring(57));	
		//將接取的影片檔案儲存到本地,拿取路徑字串,放入要送到對應資料庫Video的Bean
		MultipartFile mff = portfolioBeanVo.getVideoFile();
		//隨機唯一影片檔名
		UUID fuuid = UUID.randomUUID();
//		String filePath = "/Project/workspace_JSP/SpotsTourHSM/src/main/webapp/videos/";
		String filePath = "/_Hibernate/workspace/SpotsTourHSM/src/main/webapp/videos/";
		String fileName = fuuid + ".mp4" ;
//		videoBean.setVideoFile((StreamUtils.writeStream(mff.getBytes(),filePath,fileName)).substring(51));
		videoBean.setVideoFile((StreamUtils.writeStream(mff.getBytes(),filePath,fileName)).substring(50));
		//新增影片
		videoDao.addVideo(videoBean);
	}


	@Transactional
	@Override
	public void editPortfolio(PortfolioBeanVo portfolioBeanVo) throws IOException {
		//準備一個對應資料庫作品的Bean
		PortfolioBean portfolioBean = new PortfolioBean();
		portfolioBean.setPortfolioId(portfolioBeanVo.getPortfolioId());
		portfolioBean.setPortfolioName(portfolioBeanVo.getPortfolioName());
		portfolioBean.setP_createTime(DateTimeUtils.getTimestamps());
		portfolioBean.setpAddress(portfolioBeanVo.getpAddress());
		portfolioBean.setLatitude(portfolioBeanVo.getLatitude());
		portfolioBean.setLongitude(portfolioBeanVo.getLongitude());
		portfolioBean.setPortfolioText(portfolioBeanVo.getPortfolioText());
		//關聯會員的row
		Integer imId = portfolioBeanVo.getmId();
		MemberBean mb = MemberDao.getMemberById(imId);
		portfolioBean.setMemberBean(mb);
		//關聯地點類型的row
		Integer iptId = portfolioBeanVo.getPlaceTypeId();
		Place_TypeBean pt = place_TypeDao.getPlace_TypeById(iptId);
		portfolioBean.setPlace_TypeBean(pt);
		//關聯城市的row
		Integer icId = portfolioBeanVo.getCityId();
		CityBean cb = cityDao.getCityById(icId);
		portfolioBean.setCityBeans(cb);
		//修改作品資訊
		portfolioDao.updatePortfolio(portfolioBean);
		//===================================================================
		//準備一個對應資料庫影片的Bean
		VideoBean videoBean = new VideoBean();
		//設定獲取到的編輯作品ID
		videoBean.setVideoId(portfolioBeanVo.getVideoId());
		//凍結預設0 (不凍結)
		videoBean.setV_freeze(portfolioBeanVo.getV_freeze());
		//關聯作品的row
		videoBean.setPortfolioBean(portfolioBean);
		//處理修改的照片
		MultipartFile mfp = portfolioBeanVo.getVideoPic();
		UUID puuid = UUID.randomUUID();
//		String picPath = "/Project/workspace_JSP/SpotsTourHSM/src/main/webapp/images/vedioImages/";
		String picPath = "/_Hibernate/workspace/SpotsTourHSM/src/main/webapp/images/vedioImages/";
		String picName = puuid + ".jpg";
//		String newVideoPic = (StreamUtils.writeStream(mfp.getBytes(),picPath,picName)).substring(58);
		String newVideoPic = (StreamUtils.writeStream(mfp.getBytes(),picPath,picName)).substring(57);
		//處理修改的影片
		MultipartFile mff = portfolioBeanVo.getVideoFile();
		UUID fuuid = UUID.randomUUID();
//		String filePath = "/Project/workspace_JSP/SpotsTourHSM/src/main/webapp/videos/";
		String filePath = "/_Hibernate/workspace/SpotsTourHSM/src/main/webapp/videos/";
		String fileName = fuuid + ".mp4" ;
//		String newVideoFile = (StreamUtils.writeStream(mff.getBytes(),filePath,fileName)).substring(51);
		String newVideoFile = (StreamUtils.writeStream(mff.getBytes(),filePath,fileName)).substring(50);
		//如果原始照片大小等於0,塞入上個頁面取得的照片
		if(portfolioBeanVo.getVideoPic().getSize() == 0 ) {
			videoBean.setVideoPic(portfolioBeanVo.getStrVideoPic());
		}else {
			videoBean.setVideoPic(newVideoPic);
		}
		//如果原始影片大小等於0,塞入上個頁面取得的影片
		if(portfolioBeanVo.getVideoFile().getSize() == 0) {
			videoBean.setVideoFile(portfolioBeanVo.getStrVideoFile());
		}else {
			videoBean.setVideoFile(newVideoFile);
		}		
		//修改影片		
		videoDao.updateVideo(videoBean);
	}

	@Transactional
	@Override
	public void deletePortfolio(PortfolioBeanVo portfolioBeanVo) throws IOException {
		//準備一個對應資料庫作品的Bean
		PortfolioBean portfolioBean = new PortfolioBean();
		portfolioBean.setPortfolioId(portfolioBeanVo.getPortfolioId());
		portfolioBean.setPortfolioName(portfolioBeanVo.getPortfolioName());
		portfolioBean.setP_createTime(DateTimeUtils.getTimestamps());
		portfolioBean.setpAddress(portfolioBeanVo.getpAddress());
		portfolioBean.setLatitude(portfolioBeanVo.getLatitude());
		portfolioBean.setLongitude(portfolioBeanVo.getLongitude());
		portfolioBean.setPortfolioText(portfolioBeanVo.getPortfolioText());
		//關聯會員的row
		Integer imId = portfolioBeanVo.getmId();
		MemberBean mb = MemberDao.getMemberById(imId);
		portfolioBean.setMemberBean(mb);
		//關聯地點類型的row
		Integer iptId = portfolioBeanVo.getPlaceTypeId();
		Place_TypeBean pt = place_TypeDao.getPlace_TypeById(iptId);
		portfolioBean.setPlace_TypeBean(pt);
		//關聯城市的row
		Integer icId = portfolioBeanVo.getCityId();
		CityBean cb = cityDao.getCityById(icId);
		portfolioBean.setCityBeans(cb);
		//修改作品資訊
		portfolioDao.updatePortfolio(portfolioBean);
		//===================================================================
		//準備一個對應資料庫影片的Bean
		VideoBean videoBean = new VideoBean();
		//設定獲取到的編輯作品ID
		videoBean.setVideoId(portfolioBeanVo.getVideoId());
		//凍結設定1 (表示凍結)
		videoBean.setV_freeze(1);
		//關聯作品的row
		videoBean.setPortfolioBean(portfolioBean);
		videoBean.setVideoPic(portfolioBeanVo.getStrVideoPic());
		videoBean.setVideoFile(portfolioBeanVo.getStrVideoFile());
		//修改影片
		videoDao.updateVideo(videoBean);
		
	}
	
}
