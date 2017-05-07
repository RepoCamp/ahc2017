class MusicalWorkPresenter < Hyrax::WorkShowPresenter
  delegate :title, :composer, :genre, :composition_date, to: :solr_document

  def cover_subject
    solr_document.cover
  end
end
