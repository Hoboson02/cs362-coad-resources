# Central Oregon COAD

This is the GitHub repository for the Central Oregon Community Organizations Active
in Disaster (COAD) help service system. It connects people in need with resources
made available by members of Community Organizations Active in Disaster.

[![Ruby on Rails CI](https://github.com/Hoboson02/cs362-coad-resources/actions/workflows/rubyonrails.yml/badge.svg)](https://github.com/Hoboson02/cs362-coad-resources/actions/workflows/rubyonrails.yml)

## Development

Fork the repository:

[https://github.com/ybakos/cs362-coad-resources](https://github.com/ybakos/cs362-coad-resources)

And then clone it to your local development environment, eg: 

```
git clone git@github.com:Hoboson02/cs362-coad-resources.git
```

This is a Rails application that uses SQLite in development and PostgreSQL in production.

Install the dependencies:

```
gem install bundler
bundle install
```

You will need to set environment variables by creating a .env file. Use _.env.example_ as a template.

Next, set up the database:

```
rails db:setup
```

Note that this will seed the database with some test data.

Start the app:

```
rails server
```

## Testing

This project uses RSpec for testing.

```
rspec
```

You can also run a specific directory of tests or file by supplying its name, like so:

```
spring rspec spec/path/to/file_spec.rb
```

## Deployment

This application uses [heroku for deployment](https://devcenter.heroku.com/articles/git).
Some useful commands to know can be found below.

Set up a heroku app to deploy to:

```
heroku git:remote -a coad-resources-staging
heroku git:remote -a coad-resources

```

Rename them _staging_ and _production_:

```
git remote rename coad-resources-staging staging
git remote rename coad-resources production

```

Deploy to a heroku app:

```
git push staging
```

Migrate the rails database of a heroku app:

```
heroku run rails db:migrate --remote staging
```

Seed the rails database of a heroku app:

```
heroku run rails db:seed --remote staging
```

You will need to set environment variables by creating a .env file. Use _.env.example_ as a template.

```
heroku config:set FOO=bar
```

## Production Dependencies

PostgreSQL
Email Server (Gmail)
Recaptcha

## Data model
![erd](public/documentation/erd.png?raw=true)


&copy; 2020 Doug Dennis, Ryan Earl, James Martinez, Ryder McDowell. All rights reserved.
