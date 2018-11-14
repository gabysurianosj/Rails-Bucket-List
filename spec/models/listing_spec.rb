require 'rails_helper'

RSpec.describe Listing, type: :model do
  before(:all) do
    @listing1 = create(:listing)
  end

  it 'is valid with valid attributes' do
    expect(@listing1).to be_valid
  end

  it { is_expected.to belong_to :todolist }

  it { is_expected.to belong_to :trip }

  it { is_expected.to belong_to :user }

  it 'is not valid if the season is not a string' do
    listing2 = build(:listing, user_season: "summer")
    expect(listing2).to_not be_valid
  end

end
