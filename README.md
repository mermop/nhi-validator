# NZ National Health Index Validator

The National Health Index (NHI) number is the unique person identifier used within the New Zealand health system. It uses a checksum for validation. This is a library to do that validation.

References:

[Document from health.govt.nz](https://www.health.govt.nz/system/files/documents/pages/nhi_validation_routine_march_2017.doc)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'nhi-validator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nhi-validator

## Usage

To check if an NHI number is valid: `NHIValidator.valid?(nhi_number)`

That's it! That's the whole thing.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mermop/nhi-validator.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
