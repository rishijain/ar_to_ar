# ArToAr

One of the notable changes in Rails 5 is that models now inherit from ApplicationRecord instead of ActiveRecord::Base. So this gem helps you avoid the manual labour of changing each and every model in your rails project. Instead just use the command line tool available through this gem.

It also adds an application_record.rb file with content:
```ruby
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ar_to_ar'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ar_to_ar

## Usage

Run this command on the terminal at the root of your Rails project.

```ruby
ar_to_ar
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/rishijain/ar_to_ar.

