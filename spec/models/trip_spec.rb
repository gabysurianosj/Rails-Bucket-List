require 'rails_helper'
 RSpec.describe Trip, type: :model do
  it "can be created" do
    trip = Trip.create( title: 'Volcan Tajumulco',
                        description: 'tallest peak in Guatemala at 4,220m',
                        category: 'Hiking',
                        country: 'Guatemala',
                        status: 'Not completed',
                        day: 'Friday',
                        time: '7:00 AM',
                        season: 'summer')
    expect(trip).to be_valid
  end
end
