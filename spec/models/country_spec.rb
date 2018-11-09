require 'rails_helper'

 RSpec.describe Category, type: :model do
  it "can be created" do
    country = Country.create(name: "ABC")
    expect(country).to be_valid
  end
end
