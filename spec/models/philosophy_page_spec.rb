require 'spec_helper'

describe PhilosophyPage do
  before(:each) do
    @pp = Factory(:philosophy_page)
  end
  describe "creation" do
    
    it "should not be valid without philosophy text if published" do
      @pp.philosophy = nil
      @pp.published = true
      @pp.should_not be_valid
      @pp.published = false
      @pp.should be_valid
    end
    it "should not be valid without an associated profile" do
      @pp.profile = nil
      @pp.should_not be_valid
    end
    it "should not be valid without a published attribute" do
      @pp.published = nil
      @pp.should_not be_valid
    end
  end
  describe "methods" do
    it "should have a published? method" do
      @pp.published = true
      @pp.published?.should be_true
    end
  end
end
