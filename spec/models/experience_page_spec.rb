require 'spec_helper'

describe ExperiencePage do
  before(:each) do
    @ep = Factory(:experience_page)
  end
  describe "creation" do
    it "should not be valid without an associated profile" do
      @ep.profile = nil
      @ep.should_not be_valid
    end
    it "should not be valid without a published attribute" do
      @ep.published = nil
      @ep.should_not be_valid
    end
  end
  describe "methods" do
    it "should have a published? method" do
      @ep.published = true
      @ep.published?.should be_true
    end
    it "should have a positions method" do
      @ep.respond_to?(:positions).should == true
    end
  end
end
