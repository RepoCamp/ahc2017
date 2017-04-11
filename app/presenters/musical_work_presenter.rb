class MusicalWorkPresenter < Hyrax::WorkShowPresenter
  delegate :title, :composer, :genre, :composition_date, to: :solr_document

end
