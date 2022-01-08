require 'rails_helper'

describe User, type: :model do
  before(:each) { User.delete_all }
  it 'should add new records' do 
      expect {User.create(username: "test", email: "doesn't matter", password: "test") }
        .to(change { User.count })
    end

  it 'can\'t have two identical records' do 
    User.create(username: "test", email: "doesn't matter", password: "test")
    expect(User.new(username: "test", email: "doesn't matter", password: "test")).not_to be_valid
  end
end