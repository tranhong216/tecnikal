# Các phương thức trong vòng đời của component
ReactJs component lifecycle methods — A deep dive

> “ReactJs is a javascript library for building user interfaces” is official one liner introduction about ReactJs.

## Lifecycle method là gì ? Và Tại sao nó lại quan trọng.
Xung quanh chúng ta mọi thứ đều trải qua một chu kỳ sinh ra, phát triển và tại một thời điểm nào đó nó sẽ chết đi. Giống như cây cối, phát triển phần mềm, bản thân bạn, 1 `div` container hay UI component trong một web browser, mỗi vật đó đều sinh ra, phát triển bởi việc cập nhập và chết đi.

Các phương thức vòng đời là các phương thức khác nhau được gọi ở một thời điểm nhất định trong một vòng đời của một component. Giả sử, nếu chung ta tạo ra một app Youtube, thì ứng dụng của chúng ta sẽ phải sử dụng mạng để xem video, và nó tốn rất nhiều pin. 
Nếu người dùng chuyển tới một ứng dụng khác sau khi phát video, thì nhà phát triển đó thật tuyệt vời, chúng ta nên đảm bảo chúng ta đang sử dụng tài nguyên mạng và pin theo cách hiệu quả nhất. Bất cứ khi nào người dùng chuyển sang ứng dụng khác, chúng ta có thể dừng/ tạm dừng việc buffer video ( từng phần dữ liệu được tải về máy ), điều này sẽ ngừng sử dụng mạng và pin

Đây là những gì các phương pháp vòng đời trong ReactJ cung cấp cho chúng tôi, để nhà phát triển có thể tạo ra một ứng dụng chất lượng và đảm bảo nhà phát triển thực sự có thể lập kế hoạch và cách thực hiện tại các điểm create, update hoặc destoy khác nhau của giao diện người dùng

> Having a great understanding about the component lifecycle would excel your ability to develop quality ReactJs user interfaces.

> Hiểu tốt về vòng đời của một component nó sẽ khiến bạn phát triển giao diện người dùng ReactJs chất lượng.

## 4 giai đoạn của một React Component

Giống như bất kỳ cái gì trên thế giới, React component sẽ trải qua 4 giai đoạn sau:
- Initialization
- Mounting
- Updation
Unmounting
![](https://cdn-images-1.medium.com/max/1000/1*sn-ftowp0_VVRbeUAFECMA.png)
Để hình dung việc thực hiện các mốc trong vòng đời này, chúng ta sẽ tạo một trình phát nhạc React app có tên là trình phát nhạc Contra và thảo luận trong giai đoạn này.

### 1) Initialization

Trong giai đoạn này, React component sẽ chuẩn bị cho những hành trình đầy khó khăn của nó bằng cách khởi tạo những đạng thái, thuộc tính (props) mặc định nếu có.
Contra Mucsic Player app sẽ khởi tạo như sau:

```
class ContraMusicPlayer extends React.Component
constructor(props) {
  super(props);
  this.state = {
    volume: 70,
    status: 'pause'
  }
}
ContraMusicPlayer.defaultProps = {
  theme: 'dark'
};
```
Component sẽ cài đặt những trạng thái khởi tạo trong constructor, cái mà có thể thay đổi về sau bởi method `setState`.

`defaultProps` được định nghĩa các giá trị mặc định của props, và có thể bị ghi đè vởi giá trị mới.

Khi render `<ContraMusicPlayer/>`, Contra Mucsic Player sẽ bắt đầu với âm lượng lalf 70% trong trạng thái `tạm dừng` với giao điện tối.


Khi render `<ContraMusicPlayer theme="light"/>` Contra Mucsic Player sẽ bắt đầu với âm lượng lalf 70% trong trạng thái `tạm dừng` với giao điện sáng.

### 2) Mounting

Sau khi chuẩn bị những bước cơ bản cần thiết, state và props, React Component sẽ sẵn sàng để mount tới trình duyệt DOM. Ở  giai đoạn này sẽ có những method cho việc trước/sau mounting of components. Các method sẽ được dùng ở giai đoạn này là: 

-  **componentWillMount** được thực thi trước React Component được mount trong Dom. Vì thế, sau method này, component sẽ được mount. Tức là những gì bạn làm trước khi component mount sẽ được định nghĩa ở đây. Và Method này sẽ được thực hiện một lần trong vòng đời của một component và trước render lần đầu tiên.

- **Usage**: componentWillMount được sử dụng để khởi tạo trạng thái của state hoặc props.
- **render** mount component tới trình duyệt. Nó là method thuần, với input giống nhau thì nó sẽ trả ra các output giống nhau.
```
render() {
  <div>
     <PlayHeader>
       <Status/>
       <VolumeBar/>
       <SeekBar/>
    </PlayHeader>
   </div>
}
```

- **componentDidMount** là hook method sẽ được thực hiện khi component đã được mount vào dom. Method này cũng thực hiện một lần trong một vòng đời của component và sau khi nó render lần đầu. Ví dụ, chúng ta có thể truy cập DOm, chúng ta có thể khởi tạo thư viện JS như D3, Jquery để truy cập tới DOM.
** Usage**, trong Contra music player, chúng ta muốn tạo ra biểu đồ sóng của bài hát, chúng ta cần tích hợp D3 và thư viện thứ 3 cho việc đó.

Ví dụ dưới đây sẽ cho bạn thiếp lập hightchart khi một Dom đã sẵn sàng.

```
componentDidMount() {
 if (this.props.modules) {
            this.props.modules.forEach(function (module) {
                module(Highcharts);
            });
        }
        // Set container which the chart should render to.
        this.chart = new Highcharts[this.props.type || "Chart"](
            this.props.container, 
            this.props.options
        );
}
```

>Where should you make the API calls?
>The API calls should be made in componentDidMount method always.

### 3) Updation
Giai đoạn này bắt đầu khi react component đã được sinh ra trên trình duyệt và phát triển bằng cách nhận các cập nhập mới. Component có thể được update bằng 2 cách, gửi new props hoặc cập nhập state.

- **shouldComponentUpdate** nói React rằng khi component nhận được một props mới hoặc state mới mà đang được update, React muốn render lại hay bỏ qua việc render ? Method này là một câu hỏi, có nên cập nhập component không ?
Vì vậy method này sẽ trả về true hoặc false ứng với trược hợp re-render hoặc bỏ qua. Mặc định, method này sẽ trả về true.

**Usage**: Ví dụ trường hợp tôi muốn re-render lại component chỉ khi props bị thay đổi.

```
shouldComponentUpdate(nextProps, nextState) {
  let shouldUpdate = this.props.status !== nextProps.status;
  return shouldUpdate;
}
```
Method này thường khá là nặng, nên bạn nên tránh việc gọi render mọi thời điểm. Ví dụ, giả mỗi lần render, component sẽ khởi tạo 1000 số nguyên tố, hãy kiểm soát những ứng dụng có kiểu logic như này, thì chúng ta có thể điều khiển nó khi nó được yêu cầu khi comopent đã được render

- **componentWillUpdate** được thực thi sau khi `shouldComponentUpdate` trả về true. Method này chỉ sử dụng để thực hiện chuẩn bị cho quá trình render sắp tới, tương tự với `componentWillMount` hoặc `constructor`. Có thể có một số trường hợp sử dụng khi cần tính hoặc hoặc chuẩn bị trước khi hiện thị một số mục.

- **componentDidUpdate** được thực thi khi component đã được updated thành công trong DOM. Method này được sử dụng để như kiểu trigger các thư viện bên thư 3, đảm bảo nó chạy được với các thành phần đã được update.

### Danh sách các phương thức được gọi khi component cha gửi props mới như sau:

- **componentWillReceiveProps** được thực hiện khi các props đã thay đổi và không phải là lần đầu render. Đôi khi các state phụ thuộc vào props, do đó bất cứ khi nào props thay đổi state cũng nên được đồng bộ hóa. Đây là phương thức cần thực hiện. Phương thức tương tự cho state không tồn tại trước khi thay đổi state bởi vì các props chỉ được đọc trong một component và không bao giờ có thể phụ thuộc vào state. 

```
componentWillReceiveProps(nextProps) {
  if (this.props.status !== nextProps.status) {
    this.setState({
      state: nextProps.status
    });
  }
}

```

### 4) Unmounting
Trong giai đoạn này, component không cần nữa và component sẽ được unmounted khỏi DOM.
- **componentWillUnmount** đây là method cuối cùng trong vòng đợi, được thực thi trước khi component được xóa khỏi DOM. ** Sử dụng **: trong method này, chúng ta sẽ làm các thức để clear component. Ví dụ trong logout, chi tiết user và tất cả token xác thực sẽ được clear trước unmounting khỏi component chính.

```
componentWillUnmount() {
  this.chart.destroy();
  this.resetLocalStorage();
  this.clearSession();
}

```



























