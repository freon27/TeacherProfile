require 'spec_helper'

describe Subject do
  before(:each) do
    @subject = Factory(:subject)
  end
  describe "validation" do
    it "should not be valid without a subject name" do
      @subject.name = nil
      @subject.should_not be_valid
    end
    it "should not be valid without a level" do
      @subject.level = nil
      @subject.should_not be_valid      
    end
    it "should not be valid without a qualification" do
      @subject.qualification = nil
      @subject.should_not be_valid          
    end
    it "should not be valid without a user" do
      @subject.user = nil
      @subject.should_not be_valid          
    end    
  end
end
