require 'spec_helper'

describe Feedback do

  before(:each) do
    @feedback = Factory(:feedback)
  end
  
  describe "creation" do
    it "should not be valid without a name" do
      @feedback.name = nil
      @feedback.should_not be_valid
    end
    it "should not be valid without a position" do
      @feedback.position = nil
      @feedback.should_not be_valid
    end
    it "should not be valid without feedack" do
      @feedback.feedback = nil
      @feedback.should_not be_valid
    end
    
  end
end
