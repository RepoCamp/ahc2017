# Generated via
#  `rails generate hyrax:work MusicalWork`
require 'rails_helper'

RSpec.describe MusicalWork do
  it { is_expected.to respond_to(:composer) }
  it { is_expected.to respond_to(:genre) }
  it { is_expected.to respond_to(:composition_date) }
end
