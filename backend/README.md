[![Dependency Status](https://gemnasium.com/ADD_GEMNASIUM_TOKEN.svg)](https://gemnasium.com/renuo/<appname>) 
[![Build Status](https://travis-ci.com/renuo/<appname>.svg?token=ADD_TRAVIS_TOKEN&branch=master)](https://travis-ci.com/renuo/<appname>) 
[![Build Status](https://travis-ci.com/renuo/<appname>.svg?token=ADD_TRAVIS_TOKEN&branch=develop)](https://travis-ci.com/renuo/<appname>) 
[![Build Status](https://travis-ci.com/renuo/<appname>.svg?token=ADD_TRAVIS_TOKEN&branch=testing)](https://travis-ci.com/renuo/<appname>)

# Giftcoins Backend

This is the backend for the GiftCoins Application. 

It provides all the APIs necessary to manage the GiftCoins.

## Important Links

* TODO: link to issue tracker, wiki, important resources, etc.
* https://github.com/renuo/giftcoins
* https://giftcoins-master.renuoapp.ch
* https://giftcoins-develop.renuoapp.ch
* https://giftcoins-testing.renuoapp.ch

## Installation

```sh
git clone git@github.com:renuo/giftcoins.git
cd giftcoins
bin/setup
```

### Configuration

* config/application.yml

## Tests

```sh
bin/check
```

This runs

* keyword check (console.log, T0D0, puts, ...)
* mdl
* rubocop
* brakeman
* rake

### Tests Only

```sh
rake
```

## Run

```sh
bundle exec rails s
```

## Copyright

Copyright 2017 [Renuo AG](https://www.renuo.ch/).
