package listBooks.service;

import java.util.List;

import _02_model.entity.test.CompanyBean;



public interface CompanyService {

	List<CompanyBean> getCompany() ;

	CompanyBean getCompanyById() ;

	int getId();
	
	int getSelected();
	
	String getSelectTag();

	String getTagName();
	
	void setId(int id);

	void setSelected(int selected);

	void setTagName(String tagName);
	
}