# DocTien

Xin chào các bạn, tiếng Việt rất đẹp và theo một câu nói khá hay đó là những vấn đề của người Việt chỉ người Việt mới có thể giải quyết mà thôi.
Tôi là 1 lập trình viên Rails đang gặp 1 xíu vấn đề trong việc thực hiện tính năng "Số tiền bằng chữ: "
Qua quá trình tìm kiếm chưa thấy có một cách nào có sẵn hỗ trợ việc này.
Đó là lý do tôi viết thư viện này.
Giải quyết những việc như:
Nhập vào: 1453121401 -> Sẽ ra kết quả là: Một tỉ bốn trăm năm mươi ba triệu một trăm hai mươi mốt nghìn bốn trăm lẻ một đồng.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'doc_tien'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install doc_tien

## Usage

Rất đơn giản:
  ```ruby
  DocTien.now(35000)
  => "Ba mươi lăm nghìn  đồng"
  ```
  ```ruby
  DocTien.now(1100000000, 'VND')
  => "Một tỉ một trăm triệu VND"
  ```
  ```ruby
  DocTien.now("543000")
  => "Năm trăm bốn mươi ba nghìn  đồng"
  ```
  ```ruby
  DocTien.now(1453121407)
  => "Một tỉ bốn trăm năm mươi ba triệu một trăm hai mươi mốt nghìn bốn trăm lẻ bảy đồng"
  ```
  ```ruby
   DocTien.now(1200000)
  => "Một triệu hai trăm nghìn  đồng"
  ```
  ```ruby
  DocTien.now(100000000)
  => "Một trăm triệu đồng"
  ```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/doc_tien. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

