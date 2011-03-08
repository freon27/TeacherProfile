require 'spec_helper'

describe MainPagesController do

  before(:each) do
    @mp = Factory(:main_page)
  end
  describe "GET 'show'" do
    it "should be successful" do
      get 'show', :id => @mp.id
      response.should be_success
    end
    
    it "should assign the request user as @main_page" do
      get 'show', :id => @mp.id
      assigns(:main_page).should == @mp
    end
  end

  describe "GET 'edit'" do
    it "should be successful" do
      get 'edit', :id => @mp.id
      response.should be_success
    end

    it "should assign the request user as @main_page" do
      get 'edit', :id => @mp.id
      assigns(:main_page).should == @mp
    end
  end

  describe "GET 'update'" do
    it "should be successful" do
      get 'update', :id => @mp.id
      response.should be_success
    end

    it "should assign the request user as @main_page" do
      get 'update', :id => @mp.id
      assigns(:main_page).should == @mp
    end
  end

end
