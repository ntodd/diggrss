$:.unshift *Dir[File.dirname(__FILE__) + '/vendor/*/lib']
require 'rubygems'
require 'sinatra'
require 'builder'

get '/' do
  "Instructions"
end

get '/:channel' do
  builder do |xml|
    xml.instruct! :xml, :version => '1.0'
    xml.rss :version => "2.0" do
      xml.channel do
        xml.title "Digg - #{params[:channel].capitalize}"
        xml.description "DiggRSS feed."
        xml.link "http://digg.com/#{params[:channel]}"
        
        # @posts.each do |post|
          xml.item do
            xml.title "Item Title"
            xml.link "http://liftoff.msfc.nasa.gov/posts/1"
            xml.description "Item Description"
            xml.pubDate Time.now.rfc822()
            xml.guid "http://liftoff.msfc.nasa.gov/posts/1"
          end
        # end
      end
    end
  end
end