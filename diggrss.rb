$:.unshift *Dir[File.dirname(__FILE__) + '/vendor/*/lib']
require 'rubygems'
require 'sinatra'
require 'builder'
require 'hpricot'
require 'open-uri'
require 'chronic'

get '/' do
  "Instructions"
end

get '/:channel' do  
  doc = open("http://digg.com/#{params[:channel]}/", 'User-Agent' => 'screw-you-digg') { |f| Hpricot(f) }
  # stories = doc.search('//div.news-body')
  
  # puts stories
  
  builder do |xml|
    xml.instruct! :xml, :version => '1.0'
    xml.rss :version => "2.0" do
      xml.channel do
        xml.title "DiggRSS - #{params[:channel].capitalize}"
        xml.description "DiggRSS feed."
        xml.link "http://digg.com/#{params[:channel]}"
        
        doc.search('//div.news-body').each do |story|
          
          # pubtime = story.search('//div.news-details/span/span/span/').to_s
          pubtime = Time.now
          
          xml.item do
            xml.title story.search('//h3/a/')
            xml.link story.search('//h3/a').first[:href]
            xml.description story.search('//p/')
            # xml.pubDate Chronic.parse(story.search('//div.news-details/span/span/span/').to_s)
            xml.pubDate Time.now.rfc822()
            xml.guid story.search('//h3/a').first[:href]
          end
        end
      end
    end
  end
end