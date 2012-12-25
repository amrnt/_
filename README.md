# Reader

A tool to read a link and get its content as json data

## Usage

After installing the gem you are ready to go. For now I'm implementing Techcrunch.com

```ruby
tc = Reader::Techcrunch('http://techcrunch.com/...')
tc.as_json # {"title": "...", "body": "..."}
```

More to come.

## Installation

Add this line to your application's Gemfile:

    gem 'reader'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install reader

## TODO

* Rewrite it and make it extendable
* Wrtie more tests
* implement more Websites
* 
