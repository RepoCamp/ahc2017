# Generated via
#  `rails generate hyrax:work MusicalWork`
module Hyrax
  class MusicalWorkForm < Hyrax::Forms::WorkForm
    self.model_class = ::MusicalWork
    self.terms += [:title, :composer, :composition_date, :genre, :cover]
    self.required_fields = [:title]

    def primary_terms
      [:title, :composer, :composition_date, :genre, :cover]
    end
  end
end
