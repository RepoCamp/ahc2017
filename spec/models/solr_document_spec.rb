require 'rails_helper'

describe SolrDocument do

  subject { SolrDocument.new({}) }

  its(:title)            { is_expected.to be_empty }
  its(:composer)         { is_expected.to be_empty }
  its(:genre)            { is_expected.to be_empty }
  its(:composition_date) { is_expected.to be_empty }

  context "with complete metadata" do
    let(:work) do
      MusicalWork.new.tap do |work|
        work.composer = ["Joe Schmo"]
        work.title = ["Song"]
        work.composition_date = ["today"]
        work.genre = ["pop"]
      end
    end

    subject { SolrDocument.new(work.to_solr) }

    its(:title)            { is_expected.to contain_exactly("Song") }
    its(:composer)         { is_expected.to contain_exactly("Joe Schmo") }
    its(:genre)            { is_expected.to contain_exactly("pop") }
    its(:composition_date) { is_expected.to contain_exactly("today") }
  end
end
