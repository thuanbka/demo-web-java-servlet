package ResourceBundle;

import java.util.ListResourceBundle;

public class Res_Bun_Eng extends ListResourceBundle {

    protected Object[][] getContents() {
        return new Object[][]{
            {"count.successMessage", "Đặt hàng thành công.Đơn hàng của bạn sẽ được chuyển trong 24h tới"},
            {"count.confirmationNumberMessage", "Làm ơn nhớ mã số xác thực của bạn"},
            {"count.contactMessage", "Nếu bạn có vấn đề liên quan đến đơn đặt hàng hãy liên lạc ngay với chúng tôi <a href='#'>tại đây</a>"},
            {"count.thankYouMessage", "Cảm ơn bạn cho việc mua hàng tại shop của chúng tôi"},
            {"count.orderSummary", "Tóm tắt đơn hàng"},
            {"count.surcharge", "Phí vận chuyển"},
            {"count.total", "Tổng tiền"},
            {"count.dateProcessed", "Ngày đặt hàng"},
            {"count.deliveryAddress", "Địa chỉ giao hàng"},
            {"count.email", "Email"},
            {"count.phone", "Số điện thoại"},
            {"count.city", "Thành phố:"},
            {"count.proceedCheckout", "Check out"}

        };
    }

}
