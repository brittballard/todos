require 'spec_helper'

describe TodoMailer, '#completed_todos' do
  it 'should send the user a list of all completed todos' do
   email = TodoMailer.
     completed_todos('me@example.com').
     deliver
   expect(email.body.to_s).to eq "Test email\n"
   expect(email.to.length).to eq 1
   expect(email.to.first).to eq 'me@example.com'
  end
end
