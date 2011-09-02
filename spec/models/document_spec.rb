require 'spec_helper'

describe Document do
  before(:each) do
    @document = Factory(:document)
  end
  describe "validation" do
    it "should not be valid without a user" do
      @document.user = nil
      @document.should_not be_valid
    end
  end 
end
