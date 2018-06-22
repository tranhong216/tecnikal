# SQL Assignment
Sử dụng các câu lệnh T-SQL để tạo CSDL để quản lý sản phẩm đã bán của một cửa hàng, tạo 3 bảng để lưu trữ các thông tin sau:
Bảng Customers lưu trữ thông tin về khách hàng như MaKhach, Ten, SoDienThoai.
Bảng Items lưu trữ thông tin về hàng hóa như MaHang, Ten, SoLuong, DonGia
Bảng CustomerItem lưu trữ thông tin về những sản phẩm đã dược bán mua như MaKhach, MaHang, SoLuong.

```
CREATE DATABASE shop;
use shop;
CREATE TABLE customers (
  MaKhachHang int not null AUTO_INCREMENT,
  Ten varchar(255) not null,
  DoDienThoai varchar(30) not null,
  PRIMARY KEY (MaKhachHang)
);
CREATE TABLE items (
  MaHang int not null AUTO_INCREMENT,
  Ten varchar(255) not null,
  SoLuong int,
  Dongia int,
  PRIMARY KEY (MaHang)
);
CREATE TABLE customer_item(
  MaKhach int not null,
  MaHang int not null,
  SoLuong int
);
```

1. Nhập các thông tin sau vào CSDL(Sử dụng câu lệnh T-SQL)

```
INSERT INTO items (Ten, SoLuong, Dongia) VALUES
  ('Tu Lanh', '5', '3500'),
  ('Ti vi', '2', '3000'),
  ('Dieu Hoa', '1', '8000'),
  ('Quat Da', '5', '1700'),
  ('May Giat', '3', '5000');
  
INSERT INTO customers (Ten, DoDienThoai) VALUES
  ('Dinh Truong Son', '1234567'),
  ('Mai Thanh Minh', '1357999'),
  ('Nguyen Hong Ha', '2468888');
```

2. Nhập thông tin về các hàng đã bán sau

```

INSERT INTO customer_item (MaKhach, MaHang, SoLuong) VALUES
  (1, 1, 4),
  (1, 5, 1),
  (2, 2, 1),
  (3, 3, 1),
  (3, 1, 1);
```

3. Đặt các ràng buộc khóa chính khóa ngoại sao cho người dùng không thể xóa được thông tin về khách hàng nếu như khách hàng đã mua một sản phẩm bất kỳ

```
ALTER TABLE customer_item ADD FOREIGN KEY (MaKhach) REFERENCES customers(MaKhachHang);
ALTER TABLE customer_item ADD FOREIGN KEY (MaHang) REFERENCES items(MaHang);
```

4. Hiển thị tổng số tiền mà cửa hàng đã thu được từ các khách hàng trên

```
SELECT SUM(customer_item.SoLuong * items.Dongia) FROM customer_item
  INNER JOIN items ON items.MaHang = customer_item.MaHang;
```

5. Hiển thị tên, số tiền đã mua của người khách hàng đã trả tiền cho cửa hàng nhiều nhất

```
SELECT customers.Ten, SUM(customer_item.SoLuong*items.Dongia) tongtien FROM
  customer_item INNER JOIN items ON items.MaHang = customer_item.MaHang
  INNER JOIN customers ON customers.MaKhachHang = customer_item.MaKhach
  GROUP BY customer_item.MaKhach ORDER BY tongtien DESC LIMIT 1
```
6. Kiểm tra xem người khách có số điên thoại 2468888 có mua mặt hàng Tủ lạnh không? Nếu có mua hiện ra dòng chũ “Có mua”, ngược lại “Không mua”

```
SELECT IF (EXISTS (SELECT * FROM customer_item INNER JOIN items ON items.MaHang =
 customer_item.MaHang INNER JOIN customers ON customers.MaKhachHang = customer_item.MaKhach WHERE
  customers.DoDienThoai = '2468888' and items.Ten = 'Tu lan1h'), "co", " khong") mycheck
```
7. Tính tổng số hàng hóa và tổng tiền còn lại trong kho(Số còn lại bằng tổng số trừ đi số đã bán)

```
SELECT sum(items.SoLuong)-SUM(customer_item.SoLuong) SLcon,
sum(items.SoLuong * items.Dongia) -SUM(customer_item.SoLuong * items.Dongia) TolPrice
FROM customer_item INNER JOIN items ON items.MaHang = customer_item.MaHang
```
8. Hiẻn thị danh sách 3 mặt hàng bán chạy nhất(số lượng bán nhiều nhất)

```
SELECT items.* FROM customer_item INNER JOIN items ON items.MaHang = customer_item.MaHang
GROUP BY customer_item.MaHang ORDER By customer_item.SoLuong DESC LIMIT 3
```
9. Hiển thị tất cả các mặt hàng mà chưa bán được một cái nào.

```
SELECT items.* FROM items LEFT JOIN customer_item ON
  customer_item.MaHang = items.MaHang WHERE customer_item.MaKhach IS NULL
```
10. Hiển thị danh sách những người mua nhiều hơn một mặt hàng

```
SELECT *, COUNT(customer_item.MaHang) FROM customers INNER JOIN customer_item
  ON customer_item.MaKhach = customers.MaKhachHang GROUP By customer_item.MaKhach
```
11. Hiển thị danh sách những người mua hàng có số lượng nhiều hơn một cái

```
SELECT customers.* FROM customers INNER JOIN customer_item ON
customer_item.MaKhach = customers.MaKhachHang GROUP BY
customer_item.MaKhach HAVING COUNT(DISTINCT customer_item.MaHang) >1
```
12. Tao View co ten la vHoaDon hien thi danh sach khach hang cung hang ma ho da mua

```
CREATE VIEW vHoaDon as SELECT customers.*, items.Ten tongtien FROM
customer_item INNER JOIN items ON items.MaHang = customer_item.MaHang INNER JOIN
customers ON customers.MaKhachHang = customer_item.MaKhach
```




