# Generated via
#  `rails generate hyrax:work MusicalWork`
require 'rails_helper'

RSpec.describe Hyrax::MusicalWorksController do
  describe "::show_presenter" do
    subject { described_class.show_presenter }
    it { is_expected.to eq(MusicalWorkPresenter) }
  end
end
