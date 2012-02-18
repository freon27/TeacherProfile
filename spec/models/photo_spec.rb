require 'spec_helper'

describe Photo do
  describe "validation" do
    before(:each) do
      @photo = Factory.build(:photo)
    end
    it "should not be valid without a user" do
      @photo.user = nil
      @photo.should_not be_valid
    end
    it "should not be valid without a project" do
      @photo.project = nil
      @photo.should_not be_valid
    end
    it "should not be valid without a caption" do
      @photo.caption = nil
      @photo.should_not be_valid
    end
    it { should have_attached_file(:photo) }
    it { should validate_attachment_presence(:photo) }
    it { should validate_attachment_content_type(:photo).
                  allowing('image/png', 'image/gif').
                  rejecting('text/plain', 'text/xml') }
    it { should validate_attachment_size(:photo).
                  less_than(2.megabytes) }
  end
end
