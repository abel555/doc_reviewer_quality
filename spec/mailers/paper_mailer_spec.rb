require "rails_helper"

RSpec.describe PaperMailer, type: :mailer do
  before(:each) do
    ActionMailer::Base.delivery_method = :test
    ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.deliveries = []
  end

  it 'should send and email when the requirements are satisifed' do
    current_user = User.create(username: "test5", email: "12356@gmail.com", password: "123123", id: 323, name: "Harold", lastname: "Camacho")
    current_user.complete_name()
    paper_test = Paper.create(id:1, title: "Test", user: current_user)
    event_test = Event.create(id: 1)
    PaperMailer.status_notification(current_user, paper_test, event_test).deliver_now
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end

  after(:each) do
    ActionMailer::Base.deliveries.clear
  end
end
