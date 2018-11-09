require 'rails_helper'

RSpec.describe Todolist, type: :model do
  before(:all) do
    @todolist1 = create(:todolist)
  end

  it 'is valid with valid attributes' do
    expect(@todolist1).to be_valid
  end

  it { is_expected.to belong_to :user }

  it 'should have many trips' do
    should have_many(:trips).
      through(:listings)
  end

  it { should validate_presence_of(:name) }
end
