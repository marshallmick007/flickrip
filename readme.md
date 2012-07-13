# About

Flickrip is a HTTP 'client' for Flickr. It supports tokenizing of Flickr
Url's to flickr 'ids'

    url = "http://www.flickr.com/photos/marshallmickelson/5092430638/in/set-72157624713794623/"
    Flickrip::UrlParser.parse( url )

    > {:user=>"marshallmickelson",:imageid=>5092430638,:set=>72157624713794623}

Flickrip also comes stock with an easy way to 'browse' to the actual
image hidden behind Flickr's un-userfriendly website

    url = "http://www.flickr.com/photos/marshallmickelson/5092430638/in/set-72157624713794623/"
    flickr = Flickrip::FlickrImage.new url
    flickr.original_size  
    # nil, since this photo does not allow viewing of an original size

    flickr.largest_image
    # opens the largest image size flickr supports for this image
