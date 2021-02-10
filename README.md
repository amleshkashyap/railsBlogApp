# Basic Active Records -
* https://guides.rubyonrails.org/active\_record\_basics.html
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
* https://guides.rubyonrails.org/active\_record\_callbacks.html

# Active Records Migrations
* https://guides.rubyonrails.org/active\_record\_migrations.html

# Rails Routing

# Rails Configuration
