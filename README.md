# README


## GTM Sample App

Rails version: 5.1.6

Ruby version: 2.4.2

This is a sample app for demoing basic GTM setup for KCDC 2018. 

It supports basic user signup, login, account activation, password reset, post likes, post shares, and infinite scroll on the homepage.

The user model and functionality for signup, login, account activation, and password reset is based on the [Ruby on Rails Tutorial by Michael Haertl](https://www.railstutorial.org/book/frontmatter).

GTM code is primarily in:
1. app/assets/javascripts/analytics.js
2. app/views/layouts/_gtm.erb



Getting this up and running should be the same as with most Ruby on Rails apps

Tips for running locally in development:
1. Run `rake secret` and add that as your `SECRET_KEY_BASE` in the application.yml file (see application_example.yml)
2. Add yourself manually as an activated admin user in the console:
```
User.create!(
    username:  "<your-username-here>",
    email: "<your-email-here@example.com>",
    password:              "<your-password-here>",
    password_confirmation: "<your-password-here>",
    admin: true,
    activated: true,
    activated_at: Time.zone.now
)
```
