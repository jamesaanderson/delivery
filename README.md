# Delivery [![Code Climate](https://codeclimate.com/github/jamesaanderson/delivery.png)](https://codeclimate.com/github/jamesaanderson/delivery) [![Build Status](https://travis-ci.org/jamesaanderson/delivery.svg)](https://travis-ci.org/jamesaanderson/delivery) [![Dependency Status](https://gemnasium.com/jamesaanderson/delivery.svg)](https://gemnasium.com/jamesaanderson/delivery)

A Ruby interface to the Delivery.com API

## Installation

Add this line to your application's Gemfile:

    gem 'delivery'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install delivery

## Usage

```ruby
client = Delivery::Client.new 'client_id'

client.search '199 Water St 10038'
client.info 752
client.menu 752
client.hours 752
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
