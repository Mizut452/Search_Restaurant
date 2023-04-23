class SearchController < ApplicationController
  API_KEY = 'de7e8ea5ccd50a30'
  def search
    require 'nokogiri'

    raw_response = Faraday.get "http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=de7e8ea5ccd50a30&lat=#{params[:lat]}&lng=#{params[:lng]}&range=#{params[:range]}"
    #nokogiriによってXMLデータをRubyのハッシュ化させる
    doc = Nokogiri::XML(raw_response)
    
    data = Hash.from_xml(doc.to_s)

    results = []
    data['results']['shop'].each do |d|
      results << {
        name: shop['name'],
        access: shop['access']

      }
  end
end
