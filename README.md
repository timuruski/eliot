 Eliot
=======
> Yes, in the movie it's Eliott (with TWO Ts), but no one wants to
> type that every time.


Simple, Ruby extract, transform and load. Sorta.

Eliot is an experiment to build a framework for converting various types
of data into useful business objects with minimal setup.

A purely fictional example of the interface.

```ruby
users = Eliot.csv
             .extract(:id, :name, :_, :status, :*)
             .transform(:id, :to_i)
             .transform(:name, :first_name, :last_name) { |value| value.split(' ') }
             .transform(:name) { |value, data|
                first, last = value.split(' ', 2)
                data[:first_name] = first
                data[:last_name] = last
             }
             .fold_on(:id)
             .into { |data| User.new(data.to_hash) }
             .read('users.csv')
```
