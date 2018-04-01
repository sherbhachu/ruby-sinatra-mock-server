# ruby-sinatra-mock-server
An example of how to create a mock server using the Ruby gem 'Sinatra'

## Assumptions...

 1. You are not 100% new to Ruby
 2. You are aware of RVM (or similar tools)

## What this is / What's included....

 1. A well put together mocking server.
 2. Follows, generally, good Ruby practices.
 3. An idea of how a mock server can be setup to help test apps.
 4. Demonstrable use of Sinatra.

## What this is not...

 1. An all-in-one super duper mock server.
 2. Something that you can 100% copy over for almost any app (though I suspect you'd be able to use most, as is).

## Known limitations...

 - Currently set to explicitly run on 0.0.0.0 and a fixed port, though you can easily add capability to support explicit ip/port
 - No explicit ability to modify/remove/add JSON file on the fly. Though I am happy to add this if requested.

## Want more?

Drop me an email, sherbhachu@googlemail.com for any comments, suggestions, etc.

## Instructions/Config required prior to use...

I like to use RVM to get my house in order...

 1. cd into ruby-sinatra-mock-server/
 2. rvm use ruby-2.4.0 (or a recent-ish one)
 3. rvm gemset create ruby-sinatra-mock-server
 4. rvm gemset use ruby-sinatra-mock-server
 6. bundle install

## Start the server...

```rake```

or, fire off the command manually on a specific port...

```rackup config.ru -o '0.0.0.0' -p '9999'```


## Visit the server....

```http://localhost:<port>/```

You should then be presented with some JSON that looks like...

```
{"greeting":"Welcome to my file configurable application...this is being read from settings.yml","settings":"http://sinatrarb.com/contrib/config_file"}
```

## Playing around with the server...

There are a few endpoints setup so you can have a play around, with a mix of GET and POST routes configured.

Most, if not all are documented within the code, but here are a few to get you started...

```http://localhost:4567/hello/Sher```

```http://localhost:4567/hello/John Smith```


### 'Books' endpoint/route...

#### See some JSON based on valid endpoints/presence of specific files...

```http://localhost:4567/books?path=/```

```http://localhost:4567/books?path=/reference```

```http://localhost:4567/books?bookId=1234```

#### Hit some endpoints that are known not to exist...

```http://localhost:4567/books?path=/nothere```

```http://localhost:4567/books?bookId=45678```


### References

Even though there are some useful comments in the code, I thought I would explicitly use the README to put down just a few of the references I used to put this project together.

 1. Sinatra Best Practices (Covers modularising your routes, config.ru, helpers and more)
    - https://blog.carbonfive.com/2013/06/24/sinatra-best-practices-part-one/

 2. Sinatra documentation
    - http://sinatrarb.com/intro.html
    - http://sinatrarb.com/configuration.html
    - http://sinatrarb.com/intro.html#Using%20a%20Classic%20Style%20Application%20with%20a%20config.ru


 3. Specifics around some of the settings in app.rb (cross_origin, header modifications and more)
    - https://github.com/britg/sinatra-cross_origin
    - https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS#Preflighted_requests

 4. Other...
    - http://markhneedham.com/blog/2014/08/17/ruby-receive-json-in-request-body/