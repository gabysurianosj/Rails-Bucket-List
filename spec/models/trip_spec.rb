require 'rails_helper'
 RSpec.describe Trip, type: :model do
  it "can be created" do
    trip = Trip.create( title: 'Volcan Tajumulco',
                        description: 'tallest peak in Guatemala at 4,220m',
                        status: 'Not completed',
                        day: 'Friday',
                        time: '7:00 AM',
                        season: 'summer')

    trip.country = country
    trip.category << category
    trip.save
    expect(trip).to be_valid
  end
end
