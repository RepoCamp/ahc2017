# Advanced Hydra Camp

## Initial Setup

    git clone https://github.com/RepoCamp/ahc
    cd ahc
    git checkout -t origin/day1/start
    bundle install
    bundle exec rake hydra:test_server

### Test Suite

Open a new terminal window and run the test suite. Note: There will be failures!
At this point, you just want to ensure that Rspec runs, not that all the tests pass.

    bundle exec rspec

### Basic Application

Open a new terminal window:

    bundle exec rake db:migrate
    bundle exec rake hydra:server

Goto http://localhost:3000 and you should see the homepage for the basic Hyrax application.

### Additional Dependencies

Later in the workshop, we will be ingesting content and creating derivatives. You will need some
dependencies install to ensure this works properly. If you're already doing development work in Hydra
then chances are you already have these installed.

* Fits - any version 0.8 or later
* LibreOffice - any recent version should be fine
* ImageMagick - last 6.x release or 7.x (JPEG 2000 is not required)

For information on installing these, see the Hyrax section on [Getting Started](https://github.com/projecthydra-labs/hyrax#getting-started)
