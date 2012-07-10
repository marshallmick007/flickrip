require 'spec_helper'

describe Flickrip::UrlParser do
  before :each do
    @isseturl_mobile = "http://m.flickr.com/#/photos/d3sign/7441358166/in/set-72157630283819102/"
    @setsurl_mobile  = "http://m.flickr.com/#/photos/d3sign/sets/72157630283819102/"
    @imageurl_mobile = "http://m.flickr.com/#/photos/d3sign/7441358166/"
    @photourl_mobile = "http://m.flickr.com/#/photos/d3sign/7441358166/sizes/l/in/photostream/"

    @junkfurl_mobile = "http://m.flickr.com/#/junk/nothing/t0/s33/here/"

    #non-mobile
    @isseturl = "http://www.flickr.com/photos/d3sign/7441358166/in/set-72157630283819102/"
    @setsurl  = "http://www.flickr.com/photos/d3sign/sets/72157630283819102/"
    @imageurl = "http://www.flickr.com/photos/d3sign/7441358166/"
    @photourl = "http://www.flickr.com/photos/d3sign/7441358166/sizes/l/in/photostream/"
    @junkfurl = "http://www.flickr.com/junk/nothing/t0/s33/here/"

    @junkurl         = "http://www.someothersite.com/test"

    @insethash = {:user=>"d3sign",:imageid=>"7441358166",:setid=>"72157630283819102"}
    @sethash = {:user=>"d3sign",:setid=>"72157630283819102"}
    @imagehash = {:user=>"d3sign",:imageid=>"7441358166"}
  end

  it 'Parser cant parse a nil url' do
    Flickrip::UrlParser.parse( nil ).should == {}
  end

  it 'Parser cant parse a malformed url' do
    Flickrip::UrlParser.parse( "flickr/d3sign/7441358166/" ).should == {}
  end


  it 'Parser finds in-set Url on mobile isseturl' do
    Flickrip::UrlParser.parse( @isseturl_mobile ).should == @insethash
  end

  it 'Parser finds sets Url on mobile setsurl' do
    Flickrip::UrlParser.parse( @setsurl_mobile ).should == @sethash
  end

  it 'Parser finds image Url on mobile imageurl' do
    Flickrip::UrlParser.parse( @imageurl_mobile ).should == @imagehash
  end

    it 'Parser finds image Url on photourl' do
    Flickrip::UrlParser.parse( @photourl_mobile ).should == @imagehash
  end


  it 'Parser cant parse a junk mobile flickr url' do
    Flickrip::UrlParser.parse( @junkfurl_mobile ).should == {}
  end

  it 'Parser finds in-set Url on isseturl' do
    Flickrip::UrlParser.parse( @isseturl ).should == @insethash
  end

  it 'Parser finds sets Url on setsurl' do
    Flickrip::UrlParser.parse( @setsurl ).should == @sethash
  end

  it 'Parser finds image Url on imageurl' do
    Flickrip::UrlParser.parse( @imageurl ).should == @imagehash
  end

  it 'Parser finds image Url on photourl' do
    Flickrip::UrlParser.parse( @photourl ).should == @imagehash
  end


  it 'Parser cant parse a junk flickr url' do
    Flickrip::UrlParser.parse( @junkfurl ).should == {}
  end


  it 'Parser cant parse a junk url' do
    Flickrip::UrlParser.parse( @junkurl ).should == {}
  end

  it 'Parser can determine setness of a url' do
    Flickrip::UrlParser.is_set?( @setsurl ).should == true
  end
  
  it 'Parser can determine insetness of a url' do
    Flickrip::UrlParser.is_in_set?( @isseturl ).should == true
  end

  it 'Parser can determine imageness of a url' do
    Flickrip::UrlParser.is_image?( @imageurl ).should == true
  end
end
