module Isucon
  class App
    def self.call(env)
      new(env).call
    end

    def initialize(env)
      @env = env
      @status = nil
      @headers = {}
      @body = []
    end

    module ResponseMethods
      def response
        [@status || 200, @headers, @body]
      end

      def content_type(type)
        @headers['Content-Type'] = type
      end

      def not_found
        @status = 404
        content_type 'text/plain'
        @body = ['not found']
      end
    end

    module Actions
      def action_index
        content_type 'text/html'
        @body = ['<html><body>Hello World</body></html>']
      end
    end

    include ResponseMethods
    include Actions
  
    def call
      meth = @env['REQUEST_METHOD'.freeze]
      path = @env['PATH_INFO'.freeze]
  
      case
      when path == '/'.freeze 
        action_index
      else
        not_found
      end

      response
    end
  end
end
