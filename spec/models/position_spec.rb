require 'spec_helper'

describe Position do
  
  before(:each) do
    @position = Factory(:position)
  end
  
  describe "creation" do
    it "should not be valid without a location" do
      @position.location = nil
      @position.should_not be_valid
    end
    it "should not be valid without a date_from" do
      @position.date_from = nil
      @position.should_not be_valid
    end
    it "should not be valid if date_from is in the future" do
      @position.date_from = Date.today + 1
      @position.should_not be_valid
    end
    
  end
end
