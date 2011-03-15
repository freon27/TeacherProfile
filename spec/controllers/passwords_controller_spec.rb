require 'spec_helper'

describe MainPagesController do

  before(:each) do
    @user = Factory(:user)
  end
  describe "For signed in users" do
    before(:each) do
      sign_in_as(@user)
    end
  end

  describe "For non-signed in users" do
  end
end
