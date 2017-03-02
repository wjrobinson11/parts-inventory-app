# README

RFQ Parts Application for storing, managing and serving up industrial parts.

To start locally:

* Clone git repo and cd into it
```
git clone git@github.com:wesrobinson/rfq-parts.git
cd rfq-parts
```
```
bundle install
```
```
psql -d postgres
create database rfq_parts_development
\q
```
```
bundle exec rake db:migrate
```
```
bundle exec rake db:seed
```
```
rails s
```
Finally go to localhost:3000/parts to see the parts we currently have.
