 Eliot
=======
> Yes, in the movie it's Eliott, with *two* Ts, but no one wants to
> type that every time.


Simple, Ruby extract, transform and load. Sorta.

Eliot is an experiment to build a framework for converting various types
of data into useful business objects with minimal setup.

The interface is designed around a functional style, creating pipelines
for loading data from multiple sources.

A purely fictional example of the interface for CSV:

```ruby
Eliot.csv('ID:id', 'email', 'name', skip_blanks: true)
     .load('users_1.csv', 'users_2.csv')
     .on(:name) { |value, data|
        first, last = value.split(' ', 2)
        data[:first_name] = first
        data[:last_name] = last }
     .map { |attrs| User.new(attrs.to_h) }
```

The same interface can also be used to load JSON from remote sources.

```ruby
Eliot.json('user_id:id', 'email', 'name', top: 'users')
     .on(:id, &:to_i)
     .load('http://example.com/users')
     .each do |attrs|
       User.create(&attrs)
     end
```
