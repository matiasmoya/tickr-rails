# Tickr API Backend

## Getting Started

You probably want to install a ruby environment manager like [RVM](https://rvm.io/rvm/install)

Ruby version `2.3.0`

Install Bundler `gem install bundler`

Run `bundle install`

Run migrations

```shell
bundle exec rake db:migrate
bundle exec rake db:seed
```

Copy `config/database.yml.sample` to `config/database.yml` and configure it to your needs

## Running Tests

`bundle exec rspec`
