require "rails_helper"

RSpec.describe ReviewMailer, type: :mailer do

  before(:each) do
    ActionMailer::Base.delivery_method = :test
    ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.deliveries = []
  end

  it 'should not proceed if email is empty' do
    mail_user = User.create(username: "test", email: "123@gmail.com", password: "123123")
    ReviewMailer.review_notification(mail_user)
    expect(ActionMailer::Base.deliveries.count).to eq(0)
  end

  it 'should send and email when the requirements are satisifed' do
    test_assignment = Assingment.create(tutor_id: 123, relator_id: 12, director_id: 32)
    tutor_user = User.create(username: "test", email: "123@gmail.com", password: "123123", id: 123)
    relator_user = User.create(username: "test2", email: "1234@gmail.com", password: "123123", id: 12)
    director_user = User.create(username: "test3", email: "1235@gmail.com", password: "123123", id: 32)
    current_user = User.create(username: "test5", email: "12356@gmail.com", password: "123123", id: 323, name: "Harold", lastname: "Camacho")
    current_user.complete_name()
    paper_test = Paper.create(id:1, title: "Test", user: current_user)
    event_test = Event.create(id: 1)
    ReviewMailer.review_notification(current_user, test_assignment, paper_test, event_test).deliver_now
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end

  after(:each) do
    ActionMailer::Base.deliveries.clear
  end
end
