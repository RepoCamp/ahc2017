require 'rails_helper'

describe SolrDocument do

  subject { SolrDocument.new({}) }

  it { is_expected.to respond_to(:title) }
  it { is_expected.to respond_to(:composer) }
  it { is_expected.to respond_to(:genre) }
  it { is_expected.to respond_to(:composition_date) }
end
