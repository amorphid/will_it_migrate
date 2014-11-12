-----Will It Migrate-----

This is a quick & dirty example to demonstrate how using ActiveRecord migrations to mutate data can cause headaches.

Notes:
- created a Person model
- mutated Person records using ActiveRecord migration #20141010172135
- changed Person to Contact
- Leave reference to Person model in #20141010172135
- Tested w/ Ruby 2.1.3 & Rails 4.1.6

-----Running-----

Run "bundle exec rake db:setup":
- should NOT raise an exception
- "db:setup" creates the database from schema.rb, not the migrations
- Person in #20141010172135 is not called

Run "bundle exec rake db:reset":
- should NOT raise an exception
- like "db:setup", "db:rake" creates the database from schema.rb, not the migrations
- Person in #20141010172135 is not called

Run "bundle exec rake db:drop db:migrate":
- When migration #20141010172135 is run, an exception is raised
- Person is no longer a valid model, hence the exception

-----Thoughts-----

ActiveRecord migrations that mutate data:
- introduce intermittent bugs, which is bad
- are safer when run with begin/rescue/end (see comment in #20141010172135)
- are not obviously better than using a Rake task to accomplish the same thing
