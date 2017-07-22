# EntityRD

EntityRD is a lightweight Object-relational mapping (ORM) tools inspired by Ruby on Rails's ActiveRecord. It is designed to simplify application development by providing a set of methods that reduce the amount of time to write SQL Code and CRUD (Create, Read, Update, Destroy) Functions.

## DBObject

When using EntityRD, model components don't need to specify their attributes directly, instead they infer them from the table they are connected to. All those objects inherit from DBObject which provides a list of methods to perform database querying.

`#initialize(params = {})`
Instantiate a new object with the params passed in. Initialize takes in a hash of key value pairs with each key corresponding to a column in the database.

`::all`
Returns an array of objects representing all of the row of the table linked to the model.

`::find(id)`
Returns an object model based on the value of the primary_key column of the table.

`::table_name`

Returns the name of the table related to the current object.

`::columns`

Returns a list of all of the columns names of the table.

`::save`

Persist a new or updated record to the database.

## Filterable

By extending the `Filterable` module into the DBObject class we allow use of more advanced querying through the component model.

`::where(params)`

Returns an array of Ruby object models that match the given `params`

## Linkable

EntityRD provides way to make connection between models through Linkable. Linkable is equivalent to active record associations. Links between models make common operations simpler and easier.

`#belongs_to(name, options = {})`
Creates a one-to-one relationship between one model object with another model object based on indicated primary key and foreign key corresponding to their respective table. This will create an instance method that returns the value of the connected model provided as `name`.

`#has_many(name, options = {})`
Creates a one-to-many relationship between one model object with one or many other model object based on indicated primary key and foreign key corresponding to their respective table. This will
create an instance method that returns an array of all the values of connected model(s).

`#has_one_through(name, through_name, options = {})`
Creates a one-to-one relationship between one model object with another model object using an existing association between the two objects, `through_name`. This will create an instance method with value of the given `name` variable.
