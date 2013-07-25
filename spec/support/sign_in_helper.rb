module SignInHelper
  def sign_in
    sign_in_as('person@email.com')
  end

  def sign_in_as(email)
    visit root_path
    fill_in 'Email', with: email
    click_button 'Sign in'
  end
end

Rspec.configure do |config|
  config.include SignInHelper
end
