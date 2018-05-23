# Mô Hình Thực Thể ERD

## 1. Các giai đoạn thiết kế
phân tích, thiết kế quan niệm, thiết kế logic, thiết kế vật lý

## 2. Khái niệm - Ký Hiểu

### Khái niệm:
Entity Relationship Model là một CSDL có thể được mô hình hoá dưới dạng một tập các thực thể và mối kết hợp giữa chúng
- Thực thể: thể hiện của một đối tượng trong thế giới thực (thấy được - không thấy được). Ví dụ: ô tô, áo, nhà cung cấp, loại hàng hoá, phòng bàn. Mối thực thể sẽ có những thuộc tính riêng của thực thể đó. Ví dụ: ô tô thì có kính, có ga lăng, có bàn đạp.
- Loại thực thể: những thực thể giống nhau ( có cùng các thuộc tính). Ký hiệu: Hình chữ nhật. ( ví dụ : khách hàng).
- Thuộc tính là những đặc tính riêng của **loại thực thể ** . KH: hình oval. Nó có thể có nhiều kiểu dữ liệu khác nhau như chuối, boolean, datetime, integer.
    - Thuộc tính đơn: là thuộc tính chỉ chứa 1 giá trị. Ví dụ: KH có thuộc tính mã, ngày sinh
    - Thuộc tính kết hợp: là thuộc tính được kết hợp từ nhiều thành phần khác nhau. Ví dụ: Khách Hàng có thuộc tính địa chỉ, địa chỉ lại có thuộc tính về số nhà, đường v.v..
    - Thuộc tính đa trị: có thể có nhiều giá trị khác nhau đối với một thực thể . Ví dụ: điện thoại có 2 số chẳng hạn. KH: **2 oval lồng nhau **
    - Thuộc tính dẫn xuất: là thuộc tính tính được suy ra từ thuộc tính khác. Ví dụ tuổi khách hàng tính bằng năm hiện tại - năm sinh
    - Khoá: là tập ít nhất các thuộc tính đủ để phân biệt 2 thực thể khác nhau bất kỳ trong một tập thực thể ( Kí hiệu, oval, gạch chân chữ). Và khoá mà xác định bởi nhiều thuộc tính được gọi là ** khoá có nhiều thuộc tính **
- Mối kết hợp: là liên hệ giữa 2 hay nhiều thực thể mang một ngữ nghĩa nào đó.
- Loại mối kết hợp: tập các mối kết hợp tương tự nhau. KH: hình thoi. lấy ví dụ sau
( bổ sung thêm)
    
## 3. Loại thực thể yếu
- Là thực thể không có thuộc tính khoá => không thể nhận biết bằng tập các thuộc tính của nó -< Khoá hình thành dựa vào thuộc tính của thực thể khác. Kh. Double hình chữ nhật.
