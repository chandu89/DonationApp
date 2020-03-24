# DonationApp

Many open source contributors depend on donations to maintain their opensource work. So this app will allow opensource contributors to collect donations.

## Getting Started

1. Clone the repository.
2. Install rvm (ruby version manager).
3. Install the version of Ruby mentioned in .ruby-version file.
4. Install postgresql.
5. Install the Gem dependencies

        bundle install

6. In order to run locally, the local postgresql database will need to be set up.

        rake db:create db:migrate RAILS_ENV=development
        rake db:create db:migrate RAILS_ENV=test

7. Start the server

        rails s

8. rspec and simplecove

        COVERAGE=true rspec

Then navigate to `localhost:3000` in your browser.


## What else is there

* Rspec and simplcove is implemented for all the testing.
* Rubocop for better coding practices
* devise for user authentication
* stripe implemented for payment solution.

<img width="1289" alt="Screen Shot 2020-03-22 at 9 03 30 PM" src="https://user-images.githubusercontent.com/5196979/77293374-3388f100-6d08-11ea-929f-385ca8b3ecc3.png">
