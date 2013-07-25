require 'spec_helper'

describe Todo, '#user=' do
  it 'assigns the user to the todo' do
    todo = build(:todo)
    user = User.new('my@email.com')
    todo.user = user

    expect(todo.owner_email).to eq user.email
  end
end
