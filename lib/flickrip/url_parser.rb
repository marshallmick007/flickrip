
module Flickrip
  class UrlParser
    SET_REGEX = /^http.*flickr.*\/(.*)\/sets\/(\d+)/
    IN_SET_REGEX = /^http.*flickr.*\/(.*)\/(\d+)\/in\/set-(\d+)/
    IMAGE_REGEX = /^http.*flickr.*\/(.*)\/(\d+)/

    def self.parse(url)
      return {} if url.nil?
      # test for "/in-set/"
      g = url.scan IN_SET_REGEX
      if g.count == 1
        return Hash[ [:user,:imageid,:setid].zip g[0] ]
      end

      # test for "/sets/"
      g = url.scan SET_REGEX
      if g.count == 1
        return Hash[ [:user,:setid].zip g[0] ]
      end

      # fall back to single image
      g = url.scan IMAGE_REGEX
      if g.count == 1
        return Hash[ [:user,:imageid].zip g[0] ]
      end
      
      {}
    end
  end
end
