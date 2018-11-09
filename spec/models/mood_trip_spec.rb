require 'rails_helper'
 RSpec.describe MoodTrip, type: :model do
  it "can be created" do
    user = User.create(email: 'test@123.com', password: 'test123')
    mood = Mood.create(name: 'My Mood', user: user)
    trip = Trip.create( title: 'Volcan Tajumulco',
                        description: 'tallest peak in Guatemala at 4,220m',
                        category: 'Hiking',
                        country: 'Guatemala',
                        status: 'Not completed',
                        day: 'Friday',
                        time: '7:00 AM',
                        season: 'summer' )
    mood_trip = MoodTrip.create(mood: mood, trip: trip, user: user, user_status: 'Not completed', user_season: "summer")
    expect(mood_trip).to be_valid
  end
end
