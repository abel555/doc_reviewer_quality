require 'rails_helper'

RSpec.describe Evaluation, type: :model do

  it 'is neither quantitative or qualitative when created' do
    eval_test = Evaluation.new()
    eval_test.is_quantitative?()
    eval_test.is_qualitative?()
    expect(eval_test.valid?).to be_falsy
  end
  
end
