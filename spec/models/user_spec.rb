require 'spec_helper'

describe User, '#email' do
  it 'returns the users email' do
    user = User.new('my@email.com')
    expect(user.email).to eq 'my@email.com'
  end
end

describe User, '#todos' do
  it 'returns all of my todos' do
    user = User.new('my@email.com')
    create(:todo, owner_email: 'my@email.com')
    create(:todo, owner_email: 'not_my@email.com')
    expect(user.todos.length).to eq 1
    expect(user.todos.first.owner_email).to eq 'my@email.com'
  end
end
