# Tổng Quan Cơ Sở Dữ Liệu

## 1. Khái niệm
- Dữ liệu là những số liệu rời rạc mô tả sự vật, hiện tượng, được chọn để lưu trữ phục vụ mục đích cụ thể nào đó.

## 2. Cơ Sở Dữ Liệu là gì
- What: là nơi lưu trữ dữ liệu
- Why: Dễ tổ chức và quản lý ( lưu trữ, truy xuất)

## 3. Hệ Quản Trị CSDL ?
- Là tập hợp các chương trình cho phép người dùng tạo và quản lý một CSDL . Ví dụ: SQL Server, Oracle, MySQL, Access 2010
- Vai trò: 
    - Defining: Khai báo cấu trúc, kiểu dữ liệu và ràng buộc dữ liệu
    - Constructing: Lưu trữ dữ liệu và kiểm soát
    - Manplulating: Truy vấn để lấy dữ liệu, cập nhập để  phản ánh nhưng thay đổi.
    - Sharing: Cho phép nhiều người, nhiều ứng dụng truy cập vào CSDL
    - Protection: Ngăn các quyền truy cập bất hợp pháp, đảm bảo an toàn cho dữ liệu khi gặp sự cố.
    
## 4. Các giai đoạn xây dựng
3 giai đoạn xây dựng CSDL là:
- Khái niệm
- Logic
- Vật lý 
Mô hình dữ liệu là tập ký hiệu, quy tắc sao cho những nó mô tả dữ liệu mối quan hệ ngữ nghĩa ràng buộc.
Có 3 mô hình là Logic trên cơ sở đối tượng, mô hình logic trên cơ sở mẫu tin, và mô hình vật lý