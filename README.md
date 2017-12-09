# Plumbum

[![Build Status](https://travis-ci.org/bongloy/plumbum.svg?branch=master)](https://travis-ci.org/bongloy/plumbum)
[![Test Coverage](https://codeclimate.com/github/bongloy/plumbum/badges/coverage.svg)](https://codeclimate.com/github/bongloy/plumbum/coverage)
[![Code Climate](https://codeclimate.com/github/bongloy/plumbum/badges/gpa.svg)](https://codeclimate.com/github/bongloy/plumbum)

[Plumbum (aka Lead)](https://en.wikipedia.org/wiki/Lead) is a chemical element with symbol Pb and atomic number 82.

This gem is a ruby client wrapper for the code named "Plumbum" API. The real name of the API is supressed because of [gits](https://en.wikipedia.org/wiki/Git_(slang)).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'plumbum'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install plumbum

## Usage

### Setup your Environment Variables

Plumbum can be configured using environment variables. For convenience dotenv is included as a development dependency so you can setup your environment in `.env`.

First copy `.env.example` to `.env`

```
$ cp .env.example .env
```

Then open up `.env` and replace the dummy values with your actual values.

### Examples

See the [examples directory](https://github.com/bongloy/plumbum/tree/master/examples)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/bongloy/plumbum.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
