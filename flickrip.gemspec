# adds the lib/ directory of your gem to ruby’s load path, so you can include the 
# files within that directory relative to your load path
$LOAD_PATH.push File.expand_path("../lib", __FILE__)
require 'flickrip/version'

Gem::Specification.new do |s|
  s.name        = "flickrip"
  s.version     = Flickrip::VERSION
  s.authors     = ["Marshall Mickelson"]
  s.email       = ["flickrip@0x07.com"]

  s.summary     = "Flickr HTTP parser and image extractor"
  s.description = "Inspects flickr http/dom, and allows downloading of images and full sets"
  s.homepage    = "http://github.com/marshallmick007/flickrip"

  s.files = Dir.glob("lib/**/*.rb")
  s.test_files  = Dir.glob("{spec,test}/**/*.rb")

  s.add_development_dependency 'rspec', '~> 2.5'
end
