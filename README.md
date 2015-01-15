# Typedstream

Parse Apple's typedstream data serialisation format in Ruby.

__ This is under developing project! __

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'typedstream'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install typedstream

## Usage

```ruby
obj = Typedstream::Parser.parse(blob)
```

## Contributing

1. Fork it ( https://github.com/uetchy/typedstream/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
