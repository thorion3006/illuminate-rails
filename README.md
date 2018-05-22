# README

A simple api showcasing authentication with devise and doorkeeper gems.

* Ruby version : 2.5.1

* Rails version : 5.2.0

* **App initialization**
```ruby
# To setup the app for first run
rake db:setup
```

* **How to run the test suite**
```ruby
# To run all the tests
rspec
```

## API Endpoints

| Verb | URL | Description |
| :---: | :---: | :---: |
| POST | /api/users | Creates a new user |
| PUT | /api/users | Updates the given user |
| DELETE | /api/users | Deletes the given user |
| POST | /api/oauth/token | Generates an access_token |
| POST | /api/oauth/revoke | Revokes the access_token |

