require 'spec_helper'

describe Qualification do
  before(:each) do
    @qualification = Factory(:qualification)
  end
  describe "validation" do
    it "should not be valid without a location" do
      @qualification.location = nil
      @qualification.should_not be_valid
    end
    it "should not be valid without a from date" do
      @qualification.date_from = nil
      @qualification.should_not be_valid
    end
    it "should not be valid if a date to is provided and it is before the date from" do
      @qualification.date_to = @qualification.date_from - 1 
      @qualification.date_to = @qualification.date_to - 7
      @qualification.should_not be_valid
    end
    it "should not be valid without a user" do
      @qualification.user = nil
      @qualification.should_not be_valid
    end
  end
end