# ROR_Migration_Game_Session

Description: This APP is a small sample of having an understanding of writing migrations in Rails. We will be building a sample database of Kinator with few tables and columns.

## Make a Group table

**Run the Command**
```sh
$ rails generate model group name:string email:string
```
This command will generate model in app/models/group.rb as well as migration in db/migrate/201603XXXXXXXX_create_groups.rb

## Make a User table

**Run the command**

```sh
$ rails generate model user name:string age:integer email:string groups:references
```
This command will make a table of user in db. In models/user.rb, it will make a reverse connection with group as "belongs_to :group"
