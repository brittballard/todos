require 'spec_helper'

feature 'sign in' do
  scenario 'user signs in' do
    email = 'person@example.com'
    sign_in_as(email)
    expect(page).to have_css 'ul.todos'
    expect(page).to have_css '.welcome', text: "Welcome #{email}!"
  end
end

