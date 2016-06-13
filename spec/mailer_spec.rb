require 'spec_helper'

describe Mailer do
  describe "send_message" do
    before do
      #Third party calls are being stub, no need to hit the endpoints
      SuppressionList.stub(:get_email_blacklist).with("bounces").and_return(bounces_response)
      SuppressionList.stub(:get_email_blacklist).with("unsubscribes").and_return(unsubscribes_response)
      SuppressionList.stub(:get_email_blacklist).with("complaints").and_return(complaints_response)
    end

    subject do
      described_class.new(recipient, "Hey", "Hi")
    end
    #By testing this method, I'm assuming that this email is included in at least one of these lists 'bounces', 'complaints', 'unsubscribes'
    #Since I am stubbing the response, these are pre-defined in the support file
    #No need to test the SuppressionList class since I am testing the integration with this one
    context "whem email is in the suppression_list" do
      let(:recipient) { "complaint@mailguntest.com" }
      it { expect(subject.send_message).to eq(nil) }
    end

    #By testing this method, I'm assuming that this email is not included in any of these lists 'bounces', 'complaints', 'unsubscribes'
    context "whem email is not in the suppression_list" do
      before { Mailer.any_instance.stub(:send) { sent_message } }

      let(:recipient) { "regular@mailguntest.com" }
      it { expect(subject.send_message).to eq(sent_message) }
    end
  end


  describe "#list_of_emails_sent_to" do
    subject do
      described_class.new(recipient, "Hey", "Hi")
    end
    let(:recipient) { "user@mailguntest.com" }
    context "when there are emails" do
      before do
        Mailer.any_instance.stub(:search_for_emails_sent_to).with(recipient) { successful_list_of_emails_sent }
      end
      it { expect(subject.list_of_emails_sent_to(recipient)).to eq(expected_response) }
    end

    context "when there aren't emails" do
      before do
        Mailer.any_instance.stub(:search_for_emails_sent_to).with(recipient) { empty_list_of_emails_sent }
      end
      it { expect(subject.list_of_emails_sent_to(recipient)).to eq({}) }

    end
  end

  def expected_response
    {"user@mailguntest.com"=>[{:message_id=>"20160613013837.81381.17709.1D2FF971@sandbox5b33d3b7058543a29bac9432fcdb9756.mailgun.org", :subject=>"Subject test"}]}
  end
end
