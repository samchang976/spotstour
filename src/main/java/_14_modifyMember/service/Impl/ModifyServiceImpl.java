package _14_modifyMember.service.Impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import _02_model.entity.MemberBean;
import _14_modifyMember.dao.ModifyDao;
import _14_modifyMember.service.ModifyService;

@Service
@Transactional
public class ModifyServiceImpl implements ModifyService{

	@Autowired
	ModifyDao modifyDao;
	
	@Override
	public void save(MemberBean mb) {
		modifyDao.save(mb);
		
	}

	@Override
	public void delete(Integer mId) {
		modifyDao.delete(mId);
		
	}

	@Override
	public MemberBean get(Integer mId) {
		return modifyDao.get(mId);
	}

	@Override
	public void update(MemberBean mb) {
		modifyDao.update(mb);
		
	}

	@Override
	public List<MemberBean> getAll() {
		return modifyDao.getAll();
	}

}
