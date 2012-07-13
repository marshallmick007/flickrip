require 'nokogiri'
require 'open-uri'

#require './url_parser'

module Flickrip
  class FlickrImage
    def initialize(url)
      @url = url
    end

    def image_for_size(size="l",allow_redirect=false)
      #TODO: if size is a symbol (.sym?), then convert it to the character representation
      toks = Flickrip::UrlParser.parse @url
      if toks.has_key?(:user) && toks.has_key?(:imageid)
        pageurl = compute_page_url_for_user_imageid_size toks[:user], toks[:imageid], size
        begin
          page = Nokogiri::HTML( open( pageurl, :redirect => allow_redirect ) )
          src = page.css("div#allsizes-photo > img").first.attributes["src"].value
          return open( src )
        rescue Exception => ex
          if ex.class == OpenURI::HTTPRedirect
            # Original image size not found
          end
          # TODO: Raise NonFlickrImageUrl exception
          # TODO: if there is a 404 or 302 error, or a Flickr unauthorized request, then
          # the file size requested does not exist. Raise InvalidFlickrImageSize exception
        end
      else
        # TODO: Raise NonFlickrImageUrl exception
      end

    end

    def original_image
      image_for_size "o"
    end

    def largest_image
      # Let flickr try to redirect us to the largest size image
      image_for_size "o", true
    end

    def compute_page_url_for_user_imageid_size(user, imageid, size)
      "http://www.flickr.com/photos/#{user}/#{imageid}/sizes/#{size}/"
    end
  end
end
