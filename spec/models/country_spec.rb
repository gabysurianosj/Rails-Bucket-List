require 'rails_helper'

RSpec.describe Category, type: :model do
  before(:all) do
    @country = create(:country)
  end

  it 'is valid with valid attributes' do
    expect(@country).to be_valid
  end

  it 'has many trips' do
    should have_many(:trips)
  end
end
