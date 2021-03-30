class ApplicationController < ActionController::Base
    def hello
        render html: "hello working"    
    end
    
end
