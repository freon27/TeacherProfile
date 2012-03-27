require "spec_helper"

describe UserMailer do
  describe "registration email" do
    let(:user) { mock_model(User, :first_name => 'Lucas', :email => 'lucas@email.com') }
    let(:mail) { UserMailer.registration_confirmation(user) }

    #ensure that the subject is correct
    it 'renders the subject' do
     mail.subject.should == 'Welcome to Teaching Profile'
    end

    #ensure that the receiver is correct
    it 'renders the receiver email' do
     mail.to.should == [user.email]
    end

    #ensure that the sender is correct
    it 'renders the sender email' do
     mail.from.should == ['freon27@gmail.com']
    end

    #ensure that the name variable appears in the email body
    it "contains the users first name first_name" do
     mail.body.encoded.should match(user.first_name)
    end
  end
end
