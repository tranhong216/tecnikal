# <center>Các Lệnh SQL</center>
- SQL là một ngôn ngữ tiêu chuẩn để chứa, thao tác với dữ liệu trong database.
- RDBMS viết tắt của Relational Database Management System (Hệ thống quản lý cơ sở dữ liệu quan hệ). SQL xây dựng trên cơ sở của RDBMS
- Dữ liệu trong RDBMS được lưu trữ trong các đối tượng được gọi là các bảng **(table)**. Bảng là một tập hợp các dữ liệu *thực thể* có liên quan, trong đó mỗi thực thể bao gồm các hàng **(row/ bản ghi)** và cột **(column/ trường)**.

**PS: CÚ PHÁP SỬ DỤNG CHO BÀI VIẾT LÀ CỦA SQL**

## Lệnh CREATE/DROP [DATABASE/TABLE]
- Để tạo một database mới ta dùng câu lệnh sau:
```
CREATE DATABASE database_name;
```
- Để tạo một table từ một database mới ta dùng câu lệnh sau:
```
CREATE TABLE table_name (
    column1 data_type [Option],
    column2 data_type [Option],
    column3 data_type [Option],
   [Constraints]
);
```
**Option (Constraints -ràng buộc):**
- **NOT NULL**: yêu cầu ràng buộc giá trị ở đây không được NULL. Tức là ta không thể thêm một bản ghi nào mà không có giá trị cho cột này.
- **UNIQUE**: đảm bảo giá trị các bản ghi của cột này luôn khác nhau. Giống như PRIMARY KEY, nó sẽ đảm bảo tính duy nhất của nó trong một tập hợp các bản ghi. Bạn có thể set có nhiều cột mà không hạn chế như PRIMARY KEY **(một bảng chỉ có một PRIMARY KEY)**
- **PRIMARY KEY**: là ràng buộc xác định tính duy nhất của mỗi bản ghi trong cơ sở dữ liệu. PRIMARY KEY luôn set giá trị UNIQUE và NOT NULL. Một bảng chỉ có một khoá chính, và khoá chính đó có thể bao gồm một hoặc nhiều trường.
    - PRIMARY KEY có thể khai báo trong đoạn [Constraints] như: `PRIMARY KEY (ID)`
    - Trong trường hợp PRIMARY KEY được cấu thành từ nhiều cột thì ta khai báo vào [Constraints] như ví dụ sau:
    ```
    CREATE TABLE Persons (
        ID int NOT NULL,
        LastName varchar(255) NOT NULL,
        FirstName varchar(255),
        Age int,
        CONSTRAINT PK_Person PRIMARY KEY (ID,LastName)
    );
    ```
    Ở đây chỉ một khoá chính tên là `PK_Person` và cấu thành từ `ID` và `Lastname`
- **FOREIGN KEY**: là ràng buộc liên kết giữa 2 bảng với nhau. Tức là một trường trong bảng tham chiếu tới một trường trong một bảng khác.

    - Ràng buộc FOREIGN KEY được sử dụng để ngăn chặn các hành động có thể phá hủy các liên kết giữa các bảng.
    - Khai báo ta khai báo như ví dụ:
    ```
    CREATE TABLE Orders (
        OrderID int NOT NULL,
        OrderNumber int NOT NULL,
        PersonID int,
        PRIMARY KEY (OrderID),
        [CONSTRAINT FK_PersonOrder] FOREIGN KEY (PersonID) REFERENCES Persons(PersonID)
    );
    ```
- **CHECK**: là ràng buộc sử dụng giới hạn khoảng giá trị mà ta có thể nhập cho cột đó. Như ví dụ:
    ```
    CREATE TABLE Persons (
        ID int NOT NULL,
        LastName varchar(255) NOT NULL,
        FirstName varchar(255),
        Age int,
        CHECK (Age>=18)
    );
    ```

- **DEFAULT**: gán giá trị mặc định cho một cột khi. Giá trị mặc định sẽ được gán cho bản ghi nếu cột đó cột của bản ghi đó không chỉ định một giá trị nào. Cú pháp như sau: `DEFAULT 'Sandnes'`.
- **INDEX**: Chỉ định đánh index cho một bảng. Chi tiết sẽ bổ sung sau.
- **AUTO_INCREMENT**: Chỉ định giá trị của cột đó tự động tăng sau mỗi bản ghi. Mặc định giá trị bắt đầu từ 1. Yêu cầu kiểu dữ liệu là integer.

*Trong trường hợp, không ở trong database cần tạo bảng, ta cần dùng câu lệnh `USE database_name;` để chọn sử dụng các database đó. Sau đó mới tạo bảng.*
- Khi bạn muốn tạo table từ một table khác ta dùng lệnh sau:
```
CREATE TABLE new_table_name AS
    SELECT column1, column2,...
    FROM existing_table_name
    WHERE .... ;
```
Một bảng mới sẽ được tạo với các cột từ câu lệnh `SELECT` và bảng mới sẽ có những dữ liệu của bảng cũ được copy.

- Khi có nhu cầu cần xoá một database, ta sử dụng lệnh sau:
```
DROP DATABASE database_name;
```
***CHÚ Ý: Hãy suy nghĩ kĩ trước khi dùng câu lệnh này vì nó sẽ xoá toàn bộ dữ liệu của bạn và không thể khôi phục được. Tất nhiên là nếu bạn có một bản backup thì cứ vô tư điiii***

- Và cũng như trên, khi muốn xoá một **table** nào đó của chuối thì ta sẽ có lệnh sau:
```
DROP TABLE table_name;
```
*Chú ý: đọc lại chú ý phía trên và đọc thêm chú ý này trước khi xoá **table** nhé và nếu bạn đang không sử dụng database mà có table cần xoá, thì hãy dùng lệnh `USE` nhé :)*

- Thế nếu bạn muốn xoá hết dữ liệu của một bảng thì sao, hãy sử dụng lệnh sau nhé:
```
TRUNCATE TABLE table_name;
```
*Chú ý: đọc lại chú ý phía trên*
### Danh Mục Từ Chuyên Ngành
1. [Thực thể](db-mo-hinh-erd)