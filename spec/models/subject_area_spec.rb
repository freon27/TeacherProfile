require 'spec_helper'

describe SubjectArea do
  
  before(:each) do
    @subject_area = Factory(:subject_area)
  end
  describe "creation" do
    it "should not be valid without a published value" do
      @subject_area.published = nil
      @subject_area.should_not be_valid
    end
  end
  
  it "should not be valid without a name" do
    @subject_area.name = nil
    @subject_area.should_not be_valid
  end

end
