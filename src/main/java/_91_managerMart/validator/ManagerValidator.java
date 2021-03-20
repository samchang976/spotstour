package _91_managerMart.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import _02_model.entity.ItemBean;

public class ManagerValidator implements Validator{

	/**
	 * 回傳boolean值，表是否支援對所傳入物件進行驗證，
	 * 只有是true的情況下才會使用validate()方法進行驗證工作。
	 */
	@Override
	public boolean supports(Class<?> clazz) {
		return ItemBean.class.isAssignableFrom(clazz);
	}
	/**
	 * validate(Object target, Errors errors) 方法參數中：
	 * target：表傳入的表單物件，可對它進行驗證
	 * 如果有錯誤，可使用Errors的 reject()或rejectValue()等方法加入錯誤訊息，
	 * 在後續的處理中，若errors物件中包括錯誤訊息，會回到getViewPage ()所設定的頁面。
	 */
	@Override
	public void validate(Object target, Errors errors) {
		ItemBean itemBean = (ItemBean) target;
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "itemHeader", "", "請填寫商品名稱");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "itemPrice", "", "請填寫商品價錢");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "itemQty", "", "請填寫商品數量");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "itemDes", "", "請填寫商品描述");
		
		
//		if (itemBean.getCountryTId() == -1) {
//			errors.rejectValue("countryTId","", "請選擇國家");
//		}
		

		if (itemBean.getCountryBean().getCountryId() == -1) {
			errors.rejectValue("countryBean","", "請選擇國家");
		}
		
		if (itemBean.getItem_typeBean().getItId() == -1) {
			errors.rejectValue("item_typeBean","", "請選擇商品類型");
		}
		
	}
	
}
