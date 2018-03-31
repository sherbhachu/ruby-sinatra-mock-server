module Sinatra
  module MockServerApp
    module Helpers

      def json_response(response_code, json)
        content_type :json
        status response_code
        response.headers['Cache-Control'] = 'public, max-age=0'
        json.to_json
      end

      def parse_json_file(data_path)
        raw = File.open(File.dirname(__FILE__) + '/data/' + data_path + '.json').read
        serialized = JSON.generate(eval(raw))
        JSON.parse(serialized)
      end

      def file_exists?(data_path)
        File.exists?(File.dirname(__FILE__) + "/data/#{data_path}")
      end

    end
  end
end
