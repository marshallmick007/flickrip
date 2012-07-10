require 'spec_helper'

describe Flickrip do
  it 'should return correct version string' do
    Flickrip.version_string.should == "Flickrip version #{Flickrip::VERSION}"
  end
end
