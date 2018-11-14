require 'rails_helper'

RSpec.describe Category, type: :model do
  before(:all) do
    @category = create(:category)
  end

  it 'is valid with valid attributes' do
    expect(@category).to be_valid
  end

  it 'has many trips' do
    should have_many(:trips).
    through(:trip_categories)
  end
end
