require 'rails_helper'

 RSpec.describe Category, type: :model do
  it "can be created" do
    category = Category.create(name: "Hiking")
    expect(category).to be_valid
  end
end
