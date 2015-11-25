require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  let(:target_email) { "me@example.com" }
  let(:deliver) { UserMailer.follow_up(target_email).deliver_now }
  
  before do
    deliver
  end

  describe "sending a follow up" do
    it "queues an email" do
      expect(ActionMailer::Base.deliveries).to_not be_empty
    end
    it "has the correct to: field"do
      expect(deliver.to).to include target_email
    end
    it "has the default subject"do
      expect(deliver.subject).to eql "How are things going?"
    end
  end
end
