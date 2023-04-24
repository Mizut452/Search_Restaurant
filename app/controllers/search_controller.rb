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

  def result
        # ここで詳細ページに表示するデータを準備する
        raw_response = Faraday.get "http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=de7e8ea5ccd50a30&id=#{params[:id]}"
        doc = Nokogiri::XML(raw_response.body)
        data = Hash.from_xml(doc.to_s)

       

        @result = {
          id: data['results']['shop']['id'],
          name: data['results']['shop']['name'],
          access: data['results']['shop']['access'],
          logo: data['results']['shop']['logo_image'],
          open: data['results']['shop']['open']
        }
      end
    end
    end