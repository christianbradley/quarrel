# Quarrel

Simple named parameters for Ruby

## Installation

Add this line to your application's Gemfile:

    gem 'quarrel'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install quarrel

## Syntax

Quarrel uses a simple shorthand syntax to define named parameters. You can use any combination of these to specify
the named parameters for Quarrel's methods:

* Required parameter: A symbol ending in an alphanumeric character, ie: `:city` or `:address1`
* Optional parameter: A symbol ending with a question mark, ie: `:zip?`
* Defaulted parameter: A symbol ending with an equals sign, and followed by its default value, ie: `:country=, "US"`

## Usage

Using Quarrel is simple. Just require the quarrel gem, and then call the method you need for your use case:

### Getting values from named parameters

    def foo params
      city, state, zip, country = Quarrel.values params, :city, :state, :zip?, :country=, "US"
    end

### Setting instance variables from named parameters

    def initialize params
      Quarrel.set_instance_variables self, params, :city, :state, :zip?, :country=, "US"
    end

### Checking for unset values from optional parameters

Quarrel uses a Special Type object to represent unset values for optional parameters. To determine
if a value was not supplied for an optional parameter, call the `unset?` method:

    def foo params
      city, state, zip, country = Quarrel.values params, :city, :state, :zip?, :country=, "US"
      if Quarrel.unset?(zip) # ...
    end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
