require 'flickrip/version'
require 'flickrip/sizes'
require 'flickrip/url_parser'
require 'flickrip/flickr_image'

module Flickrip
  def self.version_string
    "Flickrip version #{Flickrip::VERSION}"
  end
end
