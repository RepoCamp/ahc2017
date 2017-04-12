# Generated via
#  `rails generate hyrax:work MusicalWork`
require 'rails_helper'

RSpec.describe Hyrax::MusicalWorkForm do
  let(:work)    { MusicalWork.new }
  let(:ability) { Ability.new(nil) }
  let(:request) { nil }
  let(:form)    { described_class.new(work, ability, request) }

  describe "::terms" do
    subject { described_class }
    its(:terms) { is_expected.to include(:title, :composer, :composition_date, :genre) }
  end

  describe "::required_fields" do
    subject { described_class }
    its(:required_fields) { is_expected.to contain_exactly(:title) }
  end

  describe "#primary_terms" do
    subject { form }
    its(:primary_terms) { is_expected.to include(:title, :composer, :composition_date, :genre) }
  end
end
