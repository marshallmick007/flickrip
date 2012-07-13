require 'spec_helper'

describe Flickrip::FlickrImage do
  before :each do
    @no_original_image = "http://www.flickr.com/photos/marshallmickelson/5092430080/sizes/l/in/set-72157630506651062/"
    @allows_original_image = "http://www.flickr.com/photos/cdevers/5066504321/"
  end

  it 'Can download an original size image' do
    i = Flickrip::FlickrImage.new @allows_original_image
    file = i.original_image
    file.class.should == Tempfile
  end

  it 'Cant download an original size image if Flickr doesnt allow it' do
    i = Flickrip::FlickrImage.new @no_original_image
    file = i.original_image
    file.should be_nil
  end

  it 'Can download the largest size available' do
    i = Flickrip::FlickrImage.new @no_original_image
    file = i.largest_image
    file.class.should == Tempfile
  end

end
