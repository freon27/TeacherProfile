require 'spec_helper'

describe MainPage do
  before(:each) do
    @mp = Factory(:main_page)
  end
  describe "creation" do
    
    it "should not be valid without introduction text" do
      @mp.introduction = nil
      @mp.should_not be_valid
    end
    it "should not be valid without an associated profile" do
      @mp.profile = nil
      @mp.should_not be_valid
    end
    it "should not be valid without a published attribute" do
      @mp.published = nil
      @mp.should_not be_valid
    end
  end
  describe "methods" do
    it "should have a published? method" do
      @mp.published = true
      @mp.published?.should be_true
    end
  end
end
