class SearchHomeController < ApplicationController
    def searchhome
        require 'rexml/document' 
 
        #APIにつなげるリンク
        raw_response = Faraday.get "http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=de7e8ea5ccd50a30/#{params[:lat]}/#{params[:lng]}}"
        @result = REXML::Document.new(raw_response)
     end
end
