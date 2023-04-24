class ResultController < ApplicationController
  API_KEY = 'de7e8ea5ccd50a30'
  def result
    raw_response = Faraday.get "http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=#{API_KEY}&id=#{params[:id]}"
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
