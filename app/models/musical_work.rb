# Generated via
#  `rails generate hyrax:work MusicalWork`
class MusicalWork < ActiveFedora::Base
  include ::Hyrax::WorkBehavior
  include ::Hyrax::BasicMetadata

  self.indexer = MusicalWorkIndexer
  # Change this to restrict which works can be added as a child.
  # self.valid_child_concerns = []
  validates :title, presence: { message: 'Your work must have a title.' }

  self.human_readable_type = 'Musical Work'

  property :composer, predicate: ::RDF::Vocab::DC11.creator do |index|
    index.as :stored_searchable
  end

  property :genre, predicate: ::RDF::Vocab::DC11.subject do |index|
    index.as :stored_searchable
  end

  property :composition_date, predicate: ::RDF::Vocab::DC11.date do |index|
    index.as :stored_searchable
  end

  property :cover, predicate: ::RDF::URI('http://opaquenamespace.org/ns/coverSubject') do |index|
    index.as :stored_searchable, :facetable
  end
end
