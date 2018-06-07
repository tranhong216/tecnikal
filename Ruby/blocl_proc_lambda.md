# Block, Proc, Lambda

## 1. Block

### Block là gì ?
Block thật ra chỉ là một đoạn code được đặt trong cặp dấu `{}` hoặc `do .. end` và k phải là đối tượng. Như ví dụ sau:
```
array = [1, 2, 3, 4, 5]
array.each{|x| puts x}
```
Đoạn code này thực hiện việc lặp qua các phần tử qua phương thức `.each` sau đó thực hiện lệnh trong dấu ngoặc nhọn là in giá trị truyền vào qua mỗi lần lặp ra ngoài màn hình.
Đơn giản đúng không!. Vậy chúng ta cùng đặt ra câu hỏi là block sinh ra để làm gì nhỉ ?
### Block để làm gì ?
- Sử dụng cho các phương thức ở dạng tổng quát như `each` hoặc `map` hay nói chung là nhóm Iterator. Tổng quát ở đây nói tới phương thức cung cấp cho ta cách truy cập dữ liệu, trả về cho ta cái gì nhưng không lộ ra cách nó thực hiện như thế nào. Đi vào thằng `each`, khi sử dụng thì nó sẽ lặp qua các phần tử trong mảng, việc mỗi phần tử sau khi lấy ra xử lý như thế nào thì nó đếch quan tâm. Mà đương nhiên nó sẽ không trả cho ta cái gì cả. Bây giờ, nếu muốn in ra màn hình mỗi phần tử thì làm như thế nào ? Ta sẽ dùng block, và trong block ta sẽ xử lý từng phần tử đó theo ý ta.
- Chúng ta có thể DRY code của mình. 
### Sử dụng nó như thế nào ?
Dù mình có đề cập tới `each` hay Iterator nhưng không hoàn toàn block chỉ sài cho mấy cái vòng lặp thôi nhé. Hãy cùng đi qua một vài ví dụ về sử dụng block nào ?
```
def say

end

say { puts "Dau rang vl" }  
```
Ở đây mình định nghĩa method trống và gọi nó kèm block. Theo bạn điều gì xảy ra, thử so sách với ví dụ ở đầu bài nhé, thì ....
- TH1: Nó không có cái gì lặp thì chắc in ra chữ `Dau rang vl`. 
- TH2: Đùa, mới tìm hiểu ._. biết gì đâu. Lỗi!, chắc là in ra lỗi, thằng bên trên đoán là in ra kết quả, thì tui đoán in ra lỗi. Kiểu gì chả được một trong hai :v.

Oh! Sự thật là không như là mơ :v. Nó đéo in ra cái gì. Why????????????? Vì m gọi method rồi truyền block vào, chứ m có bảo nó chạy cái đoạn block kia đâu ==".
- vậy để chạy được thì ta cần gọi nó và ruby cung cấp cho ta một từ khoá đó là `yeild`.
Khi gặp `yêu` ở đâu thì nó sẽ tạm dừng nhảy tới block thực hiện code trong block sau đó nó lại nhảy về và chạy tiếp đoạn code phía dưới nếu có.
- Trong trường hợp muốn truyền tham số tới block thì ta có thể viết như sau `yeild tham_so`.
Êi thế có `yêu` mà t k truyền nó block khi gọi thì sao m, thì lỗi chứ làm sao. `=> no block given (yield) (LocalJumpError)  `
Để khắc phục đó, ruby cung cấp cho cái `block_given?` check xem cái method có block k,
```
def do_something  
yield if block_given?  
end
```
## 2. Proc
