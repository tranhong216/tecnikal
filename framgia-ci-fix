Lệnh init framgia ci cho project
```
framgia-ci init ruby
```
1. Rails best practices

`rails_best_practices -g` file rails_best_practices.yml sẽ được tạo ở thư mục config, ở đó ta sẽ thêm ignore cho các trường sau:
```
LongLineCheck: {  max_line_length: 80,
  ignored_files: [
    'db/migrate', 'config/initializers'
  ] }
```
Thay thế dòng tương đương ở `.framgia-ci.yml` thành 
```
rails_best_practices:
    command: rails_best_practices -e "db/schema.rb,db/migrate,vendor,app/models/application_record.rb" --format html --output-file .framgia-ci-reports/rails_best_practices.html app/
```

2. Reek

- Xoá toàn bộ forder test in rails.
- Tạo file `.reek` tại thư mục chính của app. Và thêm các dòng sau: 
```

``


3. Rubocop

Bạn dùng 3 file rubocop đính kèm nhé

4. Scss-lint
`.scss-lint.yml`
```
scss_files: "app/assets/stylesheets/**"
exclude:
  - "app/assets/stylesheets/application.scss"
  - "app/assets/stylesheets/application.css"
  - "vendor/assets/**"
```

5. Esslint
chayj `eslint --init` lam theo huong dan
```
  eslint:
    command: eslint --format=checkstyle --output-file=.framgia-ci-reports/eslint.xml app/
```

`.eslintrc.jon`
```
{
  "env": {
    "browser": true,
    "jquery": true
  },
  "globals": {
    "window": true,
    "PNotify": true,
    "I18n": true
  },

  "extends": "eslint:recommended",
  "rules": {
    "indent": [
      "error",
      2
    ],
    "linebreak-style": [
      "error",
      "unix"
    ],
    "quotes": [
      "error",
      "single"
    ],
    "semi": [
      "error",
      "always"
    ]
  }
}
```
`.eslintignore`
```
**/*{.,-}min.js
application.js
cable.js
```

RSPEC
`rails generate rspec:install
`
