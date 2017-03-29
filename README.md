# CbsFantasySportsApiTokenFetcher

This gem can be used to fetch your API key from the CBS Fantasy Sports website.

CBS' fantasy sports sites feature an API that allows you to access data about
your league. The API is deprecated but is still available. [Check out the
documentation](http://developer.cbssports.com/documentation/api/files/sports).

The API was originally intended for the use of app developers to build add-on
applications to sell alongside CBS fantasy sports games. However, there are lots
of valuable things you can do with the API to retrieve league data such as
league rosters on a given date or add-drop transactions, etc.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cbs_fantasy_sports_api_token_fetcher'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cbs_fantasy_sports_api_token_fetcher

## Usage

You need to belong to at least one league to request an API key. If your fantasy
baseball league's CBS name was `wundersport` (check your URL), here's how you
would fetch your token:

```ruby
token = CbsFantasySportsApiTokenFetcher.new(
  league_name: "wundersport.baseball",
  password: "myvoiceismypassport",
  user_id: "me@example.com",
).fetch
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/geoffharcourt/cbs_fantasy_sports_api_token_fetcher. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

Use of the CBS Fantasy Sports API is subject to CBS' terms and conditions.
