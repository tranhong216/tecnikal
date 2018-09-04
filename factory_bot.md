1. Cài đặt
```
gem "factory_bot_rails"
gem "factory_bot"
```
2. Cấu hình
```
 #spec/support/factory_bot.rb
    RSpec.configure do |config|
      config.include FactoryBot::Syntax::Methods
    end

 #RSpec without Rails
RSpec.configure do |config|
    config.include FactoryBot::Syntax::Methods

    config.before(:suite) do
    FactoryBot.find_definitions
    end
end
```

note: thêm `require 'support/factory_bot` vào đầu file rails_helper

## Khai báo factories

```
# This will guess the User class
FactoryBot.define do
  factory :user do
    first_name "John"
    last_name  "Doe"
    admin false
  end
```

Mỗi factory được định nghĩa gồm tên và các thuộc tính. Tên của factory được dùng để đoán ra class của nó, tuy nhiên trong một số trường hợp ta cần chỉ định tên class thì có thể xem ví dụ dưới.

```
  # This will use the User class (Admin would have been guessed)
  factory :admin, class: User do
    first_name "Admin"
    last_name  "User"
    admin      true
  end
end
```
## Sử dụng
 
Factory Bot hỗ trợ mọt vài phương thức cho việc tạo đó là :
build, create, attributes_for and build_stubbed:

```
# Trả về một instance user nhưng chưa lưu
user = build(:user)

# trả về một instance user đã được lưu
user = create(:user)

# Trả về hash thuộc tính mà có thể sử dụng để build instance
attrs = attributes_for(:user)

# Returns an object with all defined attributes stubbed out
stub = build_stubbed(:user)

# Truyền block để tạo các đối tượng con qua association
create(:user) do |user|
  user.posts.create(attributes_for(:post))
end
```

## Transient Attributes (thuộc tính tạm)
xét các giá trị ngầm định để phục vụ cho callback
```
factory :user do
  transient do
    rockstar true
    upcased  false
  end

  name  { "John Doe#{" - Rockstar" if rockstar}" }
  email { "#{name.downcase}@example.com" }

  after(:create) do |user, evaluator|
    user.name.upcase! if evaluator.upcased
  end
end

create(:user, upcased: true).name
#=> "JOHN DOE - ROCKSTAR"
```
Ví dụ ở đây, ta tạo 1 factory user vs 2 thuocj tính name, email, ta dùng transient để tạo các cờ thuộc tính.
Khi create, ta truyền tham số đó vào, trong callback dựa vào tham số truyền vào nó sẽ thực hiện nếu không có, thì nó lấy giá trị mặc định trong transient đã khai báo.
