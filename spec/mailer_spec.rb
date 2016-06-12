require 'spec_helper'

describe Mailer do
  describe "send_message" do
    before do
      SuppressionList.stub(:get_email_blacklist).with("bounces").and_return(bounces_response)
      SuppressionList.stub(:get_email_blacklist).with("unsubscribes").and_return(unsubscribes_response)
      SuppressionList.stub(:get_email_blacklist).with("complaints").and_return(complaints_response)
    end

    subject do
      described_class.new(recipient, "Hey", "Hi")
    end

    context "whem email is in the suppression_list" do
      let(:recipient) { "complaint@mailguntest.com" }
      it { expect(subject.send_message).to eq(nil) }
    end


    context "whem email is not in the suppression_list" do
      before { Mailer.any_instance.stub(:send) { sent_message } }

      let(:recipient) { "regular@mailguntest.com" }
      it { expect(subject.send_message).to eq(sent_message) }
    end
  end
end
