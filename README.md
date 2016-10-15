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

This rails app comes with mysql2 adapter in the gemfile, you'll need to have mysql running in your env.

Copy `config/database.yml.sample` to `config/database.yml` and configure it to your needs.

## Running Tests

`bundle exec rspec`

## PDF Generation

Some linux system have issues with the binary files that we need to use in order to generate the PDF file. If you had a problem while doing it, you'll need to uncomment this line `exe_path: wkhtmltopdf_path, wkhtmltopdf: wkhtmltopdf_path` from config/initializers/wicked_pdf.rb, and then restart the rails server.
