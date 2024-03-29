
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

      # if we get here, we didnt have a valid flickr url
      {}
    end

    def self.is_set?(url)
      h = self.parse(url)
      h.has_key?(:user) && h.has_key?(:setid)
    end

    def self.is_in_set?(url)
      h = self.parse(url)
      h.has_key?(:user) && h.has_key?(:setid) && h.has_key?(:imageid)
    end

    def self.is_image?(url)
      h = self.parse(url)
      h.has_key?(:user) && h.has_key?(:imageid)
    end
  end
end
