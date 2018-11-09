require 'rails_helper'
 RSpec.describe Mood, type: :model do
  it "can be created" do
    user = User.create(email: 'test@123.com', password: 'test123')
    mood = Mood.create(name: 'My Mood', user: user)
    expect(mood).to be_valid
  end
end
