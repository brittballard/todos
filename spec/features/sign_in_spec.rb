require 'spec_helper'

feature 'sign in' do
  scenario 'user signs in' do
    visit root_path
    fill_in 'Email', with: 'person@email.com'
    click_button 'Sign in'
    expect(page).to have_css '.welcome', text: 'Welcome person@email.com!'
  end
end
