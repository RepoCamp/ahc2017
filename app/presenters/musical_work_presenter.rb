class MusicalWorkPresenter < Hyrax::WorkShowPresenter
  delegate :title, :composer, :genre, :composition_date, to: :solr_document

  def cover_subject
    solr_document.cover
  end

  Hyrax::MemberPresenterFactory.file_presenter_class = FileSetPresenter

  def manifest_url
    manifest_helper.polymorphic_url([:manifest, self])
  end

  private

    def manifest_helper
      @manifest_helper ||= ManifestHelper.new(request.base_url)
    end
end
