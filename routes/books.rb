module Sinatra
  module MockServerApp
    module Routing
      module Books

        def self.registered(app)

          app.get '/books?' do
            file_name = BookHelper.get_filename(params)
            if params['path'] == '/'
              #http://localhost:4567/books?path=/
              json_response(200, parse_json_file('books/all_books'))
            elsif params['path'] == '/secret'
              #http://localhost:4567/books?path=/secret
              json_response(200, parse_json_file("books/#{BookIds.SecretBook}"))
            elsif params['path'] == '/reference'
              #http://localhost:4567/books?path=/reference
              json_response(200, parse_json_file('books/reference_books'))
            elsif (file_exists? file_name + '.json')
              #http://localhost:4567/books?bookId=1234
              json_response(200, parse_json_file(file_name))
            else
              #http://localhost:4567/books?path=/nothere
              #http://localhost:4567/books?bookId=45678
              status 404
            end
          end
        end

        module BookHelper
          extend self
          def get_filename(parameters)
            "books/#{parameters['bookId']}"
          end
        end

      end
    end
  end
end
