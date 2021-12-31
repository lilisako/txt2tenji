# Txt2tenji
This gem allows you to convert any text into Japanese braille(Tenji). テキスト入力を点字に変換するライブラリです

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'txt2tenji'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install txt2tenji

## Usage

```ruby
puts Txt2tenji::generate_txt "A I SU" 
#=>
# ●- ●- ●●
# -- ●- -●
# -- -- -●

puts Txt2tenji::generate_txt "KO N NI TI WA"
# -● -- ●- ●- --
# ●- -● ●- ●● --
# -● ●● ●- ●- ●-

puts Txt2tenji::generate_txt "KO RE KA RA YO RO SI KU O NE GA I SI MA SU"
# -● ●● ●- ●- -● -● ●- ●● -● ●● -- ●- ●- ●- ●- ●●
# ●- ●● -- -● -● ●● ●● -- ●- ●- -● -- ●- ●● -● -●
# -● -- -● -- ●- -- -● -● -- ●- -- -● -- -● ●● -●

puts Txt2tenji::generate_txt "BYA KU YA"
#-● ●- ●● -●
#-● -- -- --
#-- ●● -● ●-
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/lilisako/txt2tenji.
