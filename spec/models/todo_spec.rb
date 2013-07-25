require 'spec_helper'

describe Todo, '#user=' do
  it 'assigns the user to the todo' do
    todo = build(:todo)
    user = User.new('my@email.com')
    todo.user = user

    expect(todo.owner_email).to eq user.email
  end
end

describe Todo, '#complete?' do
  it 'should return true if the todo is complete' do
    todo = build(:todo, completed_at: Time.now)
    expect(todo.complete?).to be_true
  end

  it 'should return false if the todo is not complete' do
    todo = build(:todo, completed_at: nil)
    expect(todo.complete?).to be_false
  end
end
