# README

RFQ Parts Application for storing, managing and serving up industrial parts.

To start locally:

* Clone git repo and cd into it
```
git clone git@github.com:wesrobinson/rfq-parts.git
cd rfq-parts
```
* Run a bundle
```
bundle install
```
* Create local postgres database
```
psql -d postgres
create database rfq_parts_development
\q
```
* Migrate the database
```
bundle exec rake db:migrate
```
* Seed industrial parts
```
bundle exec rake db:seed
```
* Start rails server
```
rails s
```
Finally go to localhost:3000/parts to see the parts we currently have.
