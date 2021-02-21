# easyrubydb
Simple ruby database made using https://s1.kognise.dev


### Gemfile
```
gem 'http'
gem 'json'
gem 'easyrubydb', '~> 0.0.1'
```

### Install
`gem install easyrubydb`

## Usage

Firstly get a token from https://s1.kognise.dev/token

Then you need to 
```ruby
require 'easyrubydb'
```

Next you do
```ruby
db = DB.new(name, token)
```

Where `name` is the name of your database, and `token` is the token that you got from https://s1.kognise.dev/token

Now basically all it is, is a hash that saves.

When you edit a key like this:
```ruby
db["key"] = "value"
```
It will save automatically, however if you are edditing a nested data structire like this:
```ruby
db["hash"]["key"] = "value"
```
You will have to manually call `#save` on the db. Like so:
```ruby
db["hash"]["key"] = "value"
db.save
```

If you wish to iterate of the the base keys in the db, you will have to do:
```ruby
db.data.each { |key, value| puts "#{key} is #{value}" }
```

Otherwise, you can just do:
```ruby
db["hash"].each { |key, value| puts "#{key} is #{value}" )
```
