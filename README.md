# jsonAPI RESTful: A demo of JSONAPI-Resources

This app is a tiny RESTful system implemented as an API that follows the JSON API spec, with this API you can scraping a given website through its url.


## Steps to run this app

### Clone the app

```bash
git clone git@github.com:jorge627/jsonapi-restful.git
```

### Enter to the project

```bash
cd jsonapi-restful
```

### Run bundle

```bash
bundle install
```

### Create the databases

```bash
rake db:create
```

### Migrate the database

```bash
rake db:migrate
```

### Run the server

```bash
rails s
```

### Test the API with CURL

You can add new record like this

```bash
curl -i -H "Accept: application/vnd.api+json" -H 'Content-Type:application/vnd.api+json' -X POST -d '{"data": {"type":"pages", "attributes":{"url":"http://www.google.com"}}}' http://localhost:3000/pages
```

Then you can list all urls saved and its content

```bash
curl -i -H "Accept: application/vnd.api+json" -H 'Content-Type:application/vnd.api+json' http://localhost:3000/pages
```



### Things you may want to cover:

* Ruby version
```bash
2.3.1
```

* How to run the test suite
```bash
bundle exec rspec
```


