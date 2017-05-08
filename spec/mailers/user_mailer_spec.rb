require "rails_helper"

RSpec.describe UserMailerMailer, type: :mailer do
  describe "signup_user" do
    let(:mail) { UserMailerMailer.signup_user }

    it "renders the headers" do
      expect(mail.subject).to eq("Signup user")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
