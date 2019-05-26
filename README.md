# Test Pact broker
A pact broker that sits between a [simple Rack consumer app](https://github.com/mark-maxwell/pact-consumer)
that publishes pacts, and a [Rails app](https://github.com/mark-maxwell/pact-provider)
that verifies the pacts it has with the consumer app.

Used as a little trial before using pact in a large scale project to ensure
setup and configuration is simple, and that the broker itself if decoupled from
the apps on either side.

NOTE: Log files have been commited purely for test purposes.

## Running the broker
`bundle exec rackup -p 9292`
