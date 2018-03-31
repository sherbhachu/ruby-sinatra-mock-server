module Sinatra
  module MockServerApp
    module Routing
      module General

        def self.registered(app)

          app.get '/' do
            content_type :json
            { :greeting => settings.greeting, :settings => settings.link }.to_json
          end

          app.get '/hello/:name' do
            # matches "GET /hello/foo" and "GET /hello/bar"
            # params['name'] is 'foo' or 'bar'
            if params['name'] == "John"
              "Hello John, the date/time now is #{Time.now} "
            else
              "Go away #{params['name']}!"
            end
          end

          app.post "/api" do
            request.body.rewind  # in case someone already read it
            request_payload = JSON.parse request.body.read
            #https://dzone.com/articles/ruby-receive-json-request-body
            #This below will show in the log as the data being passed in
            p request_payload #{"name": "John Smith"}
            "Hello #{request_payload['name']}!"
          end

        end

      end
    end
  end
end