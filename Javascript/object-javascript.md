# 1. Đối tượng là gì?
Trong Javascript đối tượng là một khái niệm trừu tượng thể hiện cho một đối tượng cụ thể và nó có sẵn một số đối tượng như Date, Number. Ngoài các đối tượng này thì lập trình viên có thể tự tạo một đối tượng theo ý của mình dựa vào yêu cầu của ứng dụng. Ví dụ cần tạo ra một đối tượng chuyên xử lý vấn đề về bình luận cho trang tin tức thì chúng t sẽ tạo một đối tượng Comment.

## Khởi tạo đối tượng
**Cách 1: Sử dụng từ khóa new Object()**

`var Comment = new Object();`

**Cách 2: Sử dụng từ khóa {}**

`var Comment = {};`
# 2. Thuộc tính và phương thức đối tượng
Mỗi đối tượng sẽ có các thuộc tính và phương thức.
## Thuộc tính
Thuộc tính là những đặc điểm (có thể hiểu là biến) cần lưu trữ trong đối tượng. Ví dụ với đối tượng Comment thì mình cần các thuộc tính sau.

> title

> content

> fullname

> email

Lúc này ta có thể khai báo bằng ba cách.

**Cách 1: sử dụng từ khóa new Object();**
```
var Comment = new Object();
Comment.title = '';
Comment.content = '';
Comment.fullname = '';
Comment.email = '';
```

**Cách 2: Sử dụng từ khóa {} và thêm thuộc tính ngay lúc khai báo**
```
var Comment = {
  title : '',
  content : '',
  fullname : '',
  email : ''
};
```

**Cách 3: Sử dụng từ khóa {} và thêm thuộc tính sau đó**
```
var Comment = {};
Comment.title = '';
Comment.content = '';
Comment.fullname = '';
Comment.email = '';
```

## Phương thức
Phương thức là những hành động (có thể hiểu là hàm) của đối tượng. Ví dụ trong đối tượng Comment thì mình cần hai phương thức là:

> addComment()

> validateComment()

Lúc này ta sẽ có ba cách khai báo tương tự như cách khai báo thuộc tính.

**Cách 1: Sử dụng từ khóa new Object()**

```
var Comment = new Object();
Comment.addComment = function(){
    // do some thing
};
Comment.validateComment = function(){
    // do some thing
};
```

**Cách 2: Sử dụng từ khóa {} và thêm phương thức ngay lúc khai báo**

```
var Comment = {
    addComment : function(){
        // do some thing
    },
    validateComment : function(){
        // do some thing
    }
};

```

**3. Thao tác với thuộc tính và phương thức đối tượng**

Sau khi tạo xong đối tượng thì ta có hai cách sử dụng căn bản đó là gọi và gán dữ liệu cho thuộc tính và phương thức. Nhưng nếu xem xét mọi khía cạnh thì chúng ta có các thao tác thông thường như sau:

> 
> Gán giá trị cho thuộc tính

> Lấy giá trị của thuộc tính

> Gọi phương thức

> Gán giá trị cho thuộc tính


**Gán giá trị của thuộc tính**

Để gán giá trị cho thuộc tính chúng ta chỉ việc thực hiện bằng cách sử dụng toán tử = giống như cách gán giá trị cho biến.

`Comment.title = "Tiêu đề bình luận";
`
Nhưng nếu bạn gọi từ một hàm trong đối tượng thì bạn có thể sử dụng từ khóa this.

```
var Comment = {
    title : "",
    addComment : function(){
        this.title = "Tiêu đề bình luận";
    }
};
```

**Lấy giá trị của thuộc tính**

Để lấy giá trị thuộc tính thì ta làm tương tự như thao tác với biến.

`var title = Comment.title;`

Nếu gọi từ một hàm trong đối tượng thì bạn có thể sử dụng từ khóa this.

```
var Comment = {
    title : "",
    addComment : function(){
        var title = this.title;
    }
};
```

**Gọi phương thức**

Tương tự như thuộc tính chúng ta gọi bình thường.


`comment.addComment();`


Gọi trong hàm của đối tượng.

```
var Comment = {
    title : "",
    addComment : function(){
        this.validateComment();
    },
    validateComment : function(){
        // do some thing
    }
};
```
# 4. Mảng chứa đôi tượng - đối tượng chứa đối tượng
Mỗi đối tượng (object) trong Javascript có thể chứa các đối tượng khác hoặc một mảng có thể chứa các đối tượng.

## Đối tượng chứa đối tượng
Ví dụ 1: Gom các thuộc tính của Comment vào một đối tượng Info.

```
var Comment = {
    info : {
        title : "",
        content : "",
        email : "",
        fullname : ""
    }
};
```
Ví dụ 2: Gom các phương thức (hàm) của Comment vào đối tượng func.

```
var Comment = {
    func : {
        addComment : function(){
            // Something
        },
        validateComment : function(){
            // Something
        }
    },
};
```
Lúc này để truy xuất tới các thuộc tính và phương thức này ta chỉ việc sử dụng dấu chấm và bổ sung thêm một cấp nữa.

```
Comment.info.title = "Comment ne";
Comment.func.addComment();
```

## Mảng chứa đối tượng
Để gán giá trị là một đối tượng vào mảng cũng tương tự như gán các giá trị bình thường khác (xem mảng trong Javascript).

```
// Đối tượng Comment
var Comment = {
    title  : "",
    content : "",
    email  : "",
    fullname : ""
};

// Khởi tạo mảng
var Comments = [];

// Gán giá trị cho phần tử mảng
Comments[0] = Comment;

// Gọi tới thuộc tính
Comments[0].title = "Tiêu đề bình luận";
alert(Comments[0].title);
Hoặc

// Khởi tạo mảng
var Comment = [{
    title  : "",
    content : "",
    email  : "",
    fullname : "" 
}];

// Sử dụng
Comment[0].title = "Tiêu đề bình luận";
alert(Comment[0].title);

```
