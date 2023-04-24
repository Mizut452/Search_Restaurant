class SearchController < ApplicationController
  API_KEY = 'de7e8ea5ccd50a30'
  def search
    require 'nokogiri'

    raw_response = Faraday.get "http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=de7e8ea5ccd50a30&lat=#{params[:lat]}&lng=#{params[:lng]}&range=#{params[:range]}"
    #nokogiriによってXMLデータをRubyのハッシュ化させる
    doc = Nokogiri::XML(raw_response.body)
    
    data = Hash.from_xml(doc.to_s)

    #ハッシュにされたデータから表示したいデータを抽出し、配列に入れる。
    @results = []
    data['results']['shop'].each do |d|
      @results << {
        id: d['id'],
        name: d['name'],
        access: d['access'],
        logo: d['logo_image'],
        open: d['open']
      }
  end

end
end