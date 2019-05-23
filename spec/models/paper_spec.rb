require 'rails_helper'

RSpec.describe Paper, type: :model do
  it 'has attributes' do
    paper = Paper.create(id: "123", title: "TEST")
    expect(paper.title).to eq("TEST")
  end
end
