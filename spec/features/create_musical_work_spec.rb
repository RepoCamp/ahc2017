# Generated via
#  `rails generate hyrax:work MusicalWork`
require 'rails_helper'
include Warden::Test::Helpers

RSpec.feature 'Create a musical work' do
  context 'a logged in user' do
    let(:user_attributes) do
      { email: 'test@example.com' }
    end
    let(:user) do
      User.new(user_attributes) { |u| u.save(validate: false) }
    end

    before do
      login_as user
    end

    scenario do
      visit(new_hyrax_musical_work_path)
      fill_in 'Title', with: 'Mass in B-minor'
      fill_in 'Composer', with: 'J.S. Bach'
      fill_in 'Composition date', with: '1735'
      select 'Classical', from: 'Genre'

      # TODO:
      # click_button 'Create Work'
      # expect(page).to have_content 'Test Work'
    end
  end
end
