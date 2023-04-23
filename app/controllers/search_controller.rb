class SearchController < ApplicationController
  API_KEY = 'de7e8ea5ccd50a30'
  def search
    require 'rexml/document'

    raw_response = Faraday.get "http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=de7e8ea5ccd50a30&lat=#{params[:lat]}&lng=#{params[:lng]}&range=#{params[:range]}"

    @result = REXML::Document.new(raw_response.body)
  end
end
