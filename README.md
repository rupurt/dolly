# Dolly

Dolly allows you to run rake tasks in isolation

# So what's this Dolly thing good for?

Have you ever worked on a project with a slow test suite?
If so you'll know the pain of kicking off your tests only to 
find you have to sit around for the next 5 minutes before making
any modifications to your code.

Well this is where Dolly can lend a hand. By running your tests
via Dolly they will run in an isolated environment. With a copy of
the code when you ran the tests and it's own database. That means
you can work on the next problem while you wait!

## Dependencies

- Ruby >= 1.9
- Rails >= 4.0.0

## Installation

Add this line to your application's Gemfile:

    gem 'dolly'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dolly

## Usage

To run the default rake task via dolly:

```bash
rake dolly
```

To run a specific rake task:
```bash
rake dolly[spec:unit]
```

To run multiple rake tasks
```bash
rake dolly[spec:unit] dolly[spec:acceptance]
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

[MIT](http://opensource.org/licenses/MIT)
