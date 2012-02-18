require 'spec_helper'

describe Document do
  before(:each) do
    @document = Factory.build(:document)
  end
  describe "validation" do
    it "should not be valid without a user" do
      @document.user = nil
      @document.should_not be_valid
    end
    it "should not be valid without a project" do
      @document.project = nil
      @document.should_not be_valid
    end
    it "should not be valid without a caption" do
      @document.caption = nil
      @document.should_not be_valid
    end
    it { should have_attached_file(:document) }
    it { should validate_attachment_presence(:document) }
    it { should validate_attachment_content_type(:document).
                  allowing('application/excel', 'application/msword', 'application/pdf', 'text/plain', 'application/rtf').
                  rejecting('image/png', 'image/gif') }
    it { should validate_attachment_size(:document).
                  less_than(2.megabytes) }
  end 
end



