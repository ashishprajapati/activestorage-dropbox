# Dropbox Support for Active Storage - Official Gem
### Activestorage::Service::DropboxService

Rails ActiveStorage adapter for Dropbox. Wraps the [Dropbox](https://www.dropbox.com/) Storage Service as an Active Storage service. 

[![Version](https://img.shields.io/gem/v/activestorage_dropbox.svg?style=flat-square)](https://rubygems.org/gems/activestorage_dropbox)
[![Build Status](https://travis-ci.org/ashishprajapati/activestorage_dropbox.svg?branch=master)](https://travis-ci.org/ashishprajapati/activestorage_dropbox)
[![Maintainability](https://api.codeclimate.com/v1/badges/629942b6297330c3f52f/maintainability)](https://codeclimate.com/github/ashishprajapati/activestorage_dropbox/maintainability)
[![Gem Version](https://badge.fury.io/rb/activestorage_dropbox.svg)](https://badge.fury.io/rb/activestorage_dropbox)

Reference: https://groups.google.com/forum/?fromgroups#!topic/rubyonrails-core/rOj4y3hx0Gc

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'activestorage_dropbox'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install activestorage_dropbox

## Usage
Declare an Dropbox service in config/storage.yml

```
dropbox:
  service: Dropbox
  access_token: ""
```

To use the Dropbox service in development, you add the following to config/environments/development.rb:

```
config.active_storage.service = :dropbox
```

To use the Dropbox service in production, you add the following to config/environments/production.rb:

```
config.active_storage.service = :dropbox
```

You can read more about Active Storage in the [Active Storage Overview](https://edgeguides.rubyonrails.org/active_storage_overview.html) guide.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/activestorage_dropbox. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ActivestorageDropbox project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/activestorage_dropbox/blob/master/CODE_OF_CONDUCT.md).
