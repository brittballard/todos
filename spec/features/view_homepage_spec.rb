require 'spec_helper'

feature 'view homepage' do
  scenario 'sees relavent information' do
    visit root_path

    expect(page).to have_title 'Todos'
    expect(page).to have_css '[data-role="description"]', text: 'Welcome to Todos'
  end
end
