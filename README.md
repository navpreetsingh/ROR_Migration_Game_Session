# ROR_Migration_Game_Session

Description: This APP is a small sample of having an understanding of writing migrations in Rails. We will be building a sample database of Kinator with few tables and columns.

Copy the content from **Gemfile** and **/config/database.yml** into your code. Please change the PG password in database file.

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

## Make a has_many relationship between groups & users

**Add the below line in app/models/groups.rb**
```sh
	has_many :users
```

## Lets create a database and migrate these table there

```sh
	$ rake db:create
	$ rake db:migrate
```

## Lets ses how our database looks graphical

```sh
	$ bundle exec erd
 	$ sudo apt-get install graphviz
 	$ rake diagram:all
```
Just check the file **erd.pdf** and folder **doc** to see how our database looks like.

## Time to play a little with database

**Let's create a Group**

```sh
$ rails console
> Group.connection
> Group
> Group.create(name: "Name1", email: "group1@example.com")
```

**Let's create some Users in a Group**

```sh
> group = Group.first
> group.methods.sort
> group.users.create(name: "User1", email: "user1@example.com")
> user =  User.first
> group.users.create(name: "User2", email: "user2@example.com")
> User.find(2)
> group.users
> ctrl + D
```

## Make a Channel & Product table

**Run the command**

```sh
	$ rails generate model channel name:string link:string
	$ rake db:migrate
	$ rake db:rollback
	$ rails destroy model channel name:string link:string
	$ rails generate model channel name:string site_url:string
	$ rake db:migrate
	$ rake db:migrate:down VERSION=201603XXXXXXXXX
	$ rake db:migrate:up VERSION=201603XXXXXXXXX
	$ rails generate model product name:string price:decimal
	$ rake db:migrate
```

## Time to play little more with database

**Let's create a Channel and Products**

```sh
	$ rails console
	> Channel.connection
	> Channel
	> Channel.create(name: "Channel1", site_url: "channel1@example.com")
	> Product.create(name: "Product1", price: 20.30)
	> ctrl + D
```

## Lets make a relationships between Channel, Product & Group
1. Group has_many Channels & vice-versa - HABTM relationship
2. Channel has_many Products & vice-versa - HABTM relationship

```sh
	$ rails generate migration create_join_table_channel_product channel product 
	$ rails generate migration create_join_table_channel_group channel group 
	$ rake db:migrate
```

## Lets make a relationship of models in their respective files

**Add in /models/group.rb**
```sh
	has_and_belongs_to_many :channels
	has_many :products, through: :channels
```

**Add in /models/product.rb**
```sh
	has_and_belongs_to_many :channels
```

**Add in /models/channel.rb**
```sh
	has_and_belongs_to_many :products
	has_and_belongs_to_many :groups
```
**Lets make a graphical design of db again**

## Lets add some products in the channel as well as some channels in products

Copy the content of file **/db/seeds.rb** in your file. 

```sh
	$ rake db:seed
	$ rails console
	> group = Group.find(2)
	> group.channel_ids = 1,2,3,4,5
	> channel = Channel.last
	> channel.product_ids = 10,11,12,13
```