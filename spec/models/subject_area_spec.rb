require 'spec_helper'

describe SubjectArea do
  
  before(:each) do
    @subject_area = Factory(:subject_area)
  end
  describe "creation" do
    it "should not be valid without a name" do
      @subject_area.name = nil
      @subject_area.should_not be_valid
    end
    it "should not be valid without a user" do
      @subject_area.user = nil
      @subject_area.should_not be_valid
    end
    it "should have a sample_work_page method" do
      @subject_area.respond_to?(:sample_work_page).should == true
    end 
  end
end
