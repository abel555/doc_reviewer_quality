require 'rails_helper'

RSpec.describe Review, type: :model do
  it "the default question built by a new review is empty" do
    review_test = Review.new()
    review_test.quantitative_evaluations()
    review_test.qualitative_evaluations()
    question = Question.create(type: nil, title: "test1")
    expect(review_test.build_evaluation(question)).to_not be_valid 
  end

  it "has a final equal to 0 score when created" do
    review_test = Review.new()
    expect(review_test.final_score()).to eq 0
  end
end
