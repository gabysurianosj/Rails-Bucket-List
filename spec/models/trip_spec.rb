require 'rails_helper'

RSpec.describe Trip, type: :model do
  before(:all) do
    @trip1 = create(:trip)
    @user1 = create(:user)
    @todolist1 = create(:todolist)
    @trip1.categories.create([attributes_for(:category), attributes_for(:category)])
    Listing.create( todolist: @todolist1,
                        trip: @trip1,
                        user: @user1)
                        #user_season: 1)
  end

  it 'is valid with valid attributes' do
    expect(@trip1).to be_valid
  end

  it { is_expected.to belong_to :country }

  it 'has many todolists' do
    should have_many(:todolists).
    through (:listings)
  end

  it 'has many users' do
    should have_many(:users).
    through (:listings)
  end

  it 'has many categories' do
    should have_many(:categories).
    through (:trip_categories)
  end

  it { should validate_presence_of(:title) }

  it 'validates that the title and country are unique' do
    country1 = create(:country)
    trip1 = create(:trip, title: "Zugpspitze", country: country1)
    trip2 = build(:trip, title: "Zugspitze", country: country1)
    expect(trip2).to_not be_valid
  end

  it { should validate_presence_of(:season) }

  it 'is not valid if the season is a number' do
    trip2 = build(:trip, season: 2)
    expect(trip2).to_not be_valid
  end
end
