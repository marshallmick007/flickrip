require 'spec_helper'

describe Flickrip::UrlParser do
  before :each do
    @isseturl_mobile = "http://m.flickr.com/#/photos/d3sign/7441358166/in/set-72157630283819102/"
    @setsurl_mobile  = "http://m.flickr.com/#/photos/d3sign/sets/72157630283819102/"
    @imageurl_mobile = "http://m.flickr.com/#/photos/d3sign/7441358166/"
    @junkfurl_mobile = "http://m.flickr.com/#/junk/nothing/t0/s33/here/"

    #non-mobile
    @isseturl = "http://www.flickr.com/photos/d3sign/7441358166/in/set-72157630283819102/"
    @setsurl  = "http://www.flickr.com/photos/d3sign/sets/72157630283819102/"
    @imageurl = "http://www.flickr.com/photos/d3sign/7441358166/"
    @junkfurl = "http://www.flickr.com/junk/nothing/t0/s33/here/"

    @junkurl         = "http://www.someothersite.com/test"

    @insethash = {:user=>"d3sign",:imageid=>"7441358166",:setid=>"72157630283819102"}
    @sethash = {:user=>"d3sign",:setid=>"72157630283819102"}
    @imagehash = {:user=>"d3sign",:imageid=>"7441358166"}
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

  it 'Parser cant parse a junk flickr url' do
    Flickrip::UrlParser.parse( @junkfurl ).should == {}
  end


  it 'Parser cant parse a junk url' do
    Flickrip::UrlParser.parse( @junkurl ).should == {}
  end
end
