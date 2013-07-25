require 'spec_helper'

feature 'manage todos' do
  scenario 'user creates a todo' do
    visit root_path
    fill_in 'Email', with: 'person@email.com'
    click_button 'Sign in'
    click_link 'Add new todo'
    fill_in 'Description', with: 'Buy some milk'
    click_button 'Create todo'
    expect(page).to have_css '.todo', text: 'Buy some milk'
  end
end
