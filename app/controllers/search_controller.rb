class SearchController < ApplicationController
  require 'kaminari'
  
  def search_window
    #search_windowは別のレイアウトを使用する。
    render layout: "search_window"
  end

  def search
    require 'nokogiri'
    require 'uri'

    keyword = URI.encode_www_form_component(params[:keyword])
    begin
    raw_response = Faraday.get "http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=de7e8ea5ccd50a30&lat=#{params[:lat]}&lng=#{params[:lng]}&range=#{params[:range]}&keyword=#{keyword}&count=20"
    #nokogiriによってXMLデータをRubyのハッシュ化させる
    if raw_response.success?
    doc = Nokogiri::XML(raw_response.body)
    data = Hash.from_xml(doc.to_s)

    #ハッシュにされたデータから表示したいデータを抽出し、配列に入れる。
    @results = []
    data['results']['shop'].each do |d|
      @results << {
        id: d['id'],
        name: d['name'],
        access: d['access'],
        genre: d['genre']['name'],
        logo: d['logo_image'],
        open: d['open']
      }
    end

    @posts = Kaminari.paginate_array(@results).page(params[:page] || 1).per(5)

    #店が見つからなかった場合、またはほかのエラーが発生した場合、エラーページへ飛ぶ。
    else
      render 'search/error' 
    end
  rescue Faraday::ConnectionFailed => e
      render 'search/error'
    rescue => e
      render 'search/error'
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
          genre: data['results']['shop']['genre']['name'],
          open: data['results']['shop']['open'],
          catch: data['results']['shop']['genre']['catch'],
          photo: data['results']['shop']['photo']['pc']['l'],
          address: data['results']['shop']['address']
        }
      end
    end
    end