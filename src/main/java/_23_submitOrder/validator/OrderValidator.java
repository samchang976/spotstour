package _23_submitOrder.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import _23_submitOrder.vo.OrderVo;

public class OrderValidator implements Validator{

	/**
	 * 回傳boolean值，表是否支援對所傳入物件進行驗證，
	 * 只有是true的情況下才會使用validate()方法進行驗證工作。
	 */
	@Override
	public boolean supports(Class<?> clazz) {
		return OrderVo.class.isAssignableFrom(clazz);
	}
	/**
	 * validate(Object target, Errors errors) 方法參數中：
	 * target：表傳入的表單物件，可對它進行驗證
	 * 如果有錯誤，可使用Errors的 reject()或rejectValue()等方法加入錯誤訊息，
	 * 在後續的處理中，若errors物件中包括錯誤訊息，會回到getViewPage ()所設定的頁面。
	 */
	@Override
	public void validate(Object target, Errors errors) {
		OrderVo orderVo = (OrderVo) target;
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "s_mAddress", "", "請填寫配送地址");
		
		
		if (orderVo.getShipTypeId() == -1) {
			errors.rejectValue("shipTypeId","", "請挑選取貨方式");
		}
		if (orderVo.getReceiptTypeId() == -1) {
			errors.rejectValue("receiptTypeId","", "請挑選發票型式");
		}
		if (orderVo.getPaymentTypeId() == -1) {
			errors.rejectValue("paymentTypeId","", "請!挑!選!付!款!方!式!");
		}
	}

}
