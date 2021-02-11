# Description - 
* Sign Up, Login, Logout, View User Info
* create/delete/edit articles/comments for logged in users - article and comment writer can delete a comment, article writer can delete/edit an article
* Logged out users can read all articles and check the feeds
* After article creation, it's published to the feed and if an article is deleted, it's removed from the feed - feed has articles of last one week only
* Sidekiq - for adding/deleting articles to/from the feed, cron job to delete articles older than a week from the feed
* Rake - tasks to create a user/feed, task to initialize the feed using the created articles
* Migrations - look at password to password\_digest conversion if using 'has\_secure\_password', migrations for foreign key addition
* Other useful articles apart from the official guides below - 
  1. https://levelup.gitconnected.com/simple-authentication-guide-with-ruby-on-rails-16a6255f0be8
  2. https://itnext.io/sidekiq-overview-and-how-to-deploy-it-to-heroku-b8811fea9347

# Basic Active Records -
* https://guides.rubyonrails.org/active_record_basics.html
* Naming conventions
  1. Object-Table - eg, Person (object) => people (table), LineItem (object) => line\_items(table)
  2. Foreign Keys - singularizedtablename\_id (eg, line\_item\_id)
  3. Primary Key - default created as "id"
  4. Other Fields - created\_at, updated\_at, lock\_version, type
  5. Override - for table name use self.table\_name = "<new name>", for primary key use self.primary\_key = "<new name>", etc
* CRUD
  1. Create - use "create" for creating and saving to DB, use "new" for creating and returning without saving
  2. Read - use "all", "first", "find\_by" and "where" for all entries, first entry, first entry using some conditions, 
     and all entries using some conditions respectively.
  3. Update - use "update" and "update\_all".
  4. Delete - use "destroy", "destroy\_by" and "destroy\_all"

# Active Records Callbacks
* https://guides.rubyonrails.org/active_record_callbacks.html

# Active Records Migrations
* https://guides.rubyonrails.org/active_record_migrations.html

# Rails Routing
* https://guides.rubyonrails.org/routing.html

# Rails Configuration
* https://guides.rubyonrails.org/configuring.html

# Sidekiq
* https://github.com/mperham/sidekiq/wiki/Getting-Started
