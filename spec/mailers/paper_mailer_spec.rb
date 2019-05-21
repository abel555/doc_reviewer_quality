require "rails_helper"

RSpec.describe PaperMailer, type: :mailer do
  before(:each) do
    ActionMailer::Base.delivery_method = :test
    ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.deliveries = []
  end

  it 'should not proceed if email is empty' do
    mail_user = User.create(username: "test", email: "123@gmail.com", password: "123123")
    PaperMailer.status_notification(mail_user)
    expect(ActionMailer::Base.deliveries.count).to eq(0)
  end

  after(:each) do
    ActionMailer::Base.deliveries.clear
  end
end
