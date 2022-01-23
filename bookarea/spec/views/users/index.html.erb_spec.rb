# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'users/index', type: :view do
  before(:each) do
    assign(:users, [
             User.create!(username: 'test1', email: "doesn't matter", password: 'test'),
             User.create!(username: 'test2', email: "doesn't matter but another", password: 'test')
           ])
  end

  it 'renders a list of users' do
    render
  end
end
