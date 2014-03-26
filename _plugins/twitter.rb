require 'open-uri'
require 'json'

module Jekyll

  class EmbeddedTweetConverter < Converter

    safe true

    priority :low

    def matches(ext)
      ext =~ /^\.html$/
    end

    def output_ext(ext)
      ".html"
    end

    def convert(content)
      content.scan(/(https?:\/\/twitter\.com\/[a-zA-Z0-9_]+\/status\/([0-9]+)\/?)/).each { |url, id|
        json = open("https://api.twitter.com/1/statuses/oembed.json?id=#{id}").read
        html = JSON.parse(json)['html']
        content = content.gsub(/#{url}/, html)
      }
      content
    end
  end
end
