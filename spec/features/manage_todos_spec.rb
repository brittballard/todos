require 'spec_helper'

feature 'manage todos' do
  scenario 'user creates a todo' do
    sign_in
    add_todo_with_description('Buy some milk')
    expect(page).to have_css '.todo', text: 'Buy some milk'
  end

  scenario "I only see my todos and not other people's" do
    create(:todo, description: 'Not my todo', owner_email: 'not_my@email.com')
    create(:todo, description: 'My todo', owner_email: 'my@email.com')
    sign_in_as('my@email.com')

    expect(page).to_not have_css 'li.todo', text: 'Not my todo'
    expect(page).to have_css 'li.todo', text: 'My todo'
  end

  scenario 'user can mark a todo as complete' do
    create(:todo, description: 'My todo', owner_email: 'my@email.com')
    sign_in_as('my@email.com')
    click_link 'Complete'
    expect(page).to have_css 'li.completed'
  end

  scenario 'user can request a list of completed todos via email' do
    sign_in_as('my@email.com')
    create(:todo, description: 'My todo', completed_at: Time.now)
    click_link 'Email completed todos'
    expect(ActionMailer::Base.deliveries.length).to eq 1
    expect(ActionMailer::Base.deliveries[0].body.to_s).to match /Test email/
  end
end

def add_todo_with_description(description)
  click_link 'Add new todo'
  fill_in 'Description', with: description
  click_button 'Create todo'
end
