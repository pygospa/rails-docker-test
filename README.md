# Setup a dockerised RAILS environment with no local Ruby/Rails installed

## Steps to reproduce setup

1. Install `docker`, `docker-compose` on your local machine
1. Create project folder and switch to it
1. Create `Dockerfile` for the Rails-app by using standard image and install
   build packages, ruby and bundler
1. Create `docker-compose.yml` to...
  1. ... _stich_ together the previously created Rails-app image with a
     standardized DB image from dockerhub
  1. ... start Rails-app container with proper bindings, ports, etc.
1. `touch Gemfile Gemfile.lock`, and switch content of `Gemfile` to only contain
   rails gem
1. Run `docker-compose up --build` to create image that only contains rails
1. Kill process after it runs into error (no Rails app to start)
1. Run `docker-compose run --user $(id -u):$(id -g) app rails new . --force
   --database=postgresql --skip-bundle` to initialize new Rails app
1. Modify `config/database.yml` to use database
1. Run `docker-compose down && docker-compose up --build` because after creating
   Rails app the `Gemfile` was overwritten
1. Create DB from Rails vai `docker-compose exec app rails db:create`

