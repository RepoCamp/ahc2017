# Generated via
#  `rails generate hyrax:work MusicalWork`
module Hyrax
  class MusicalWorkForm < Hyrax::Forms::WorkForm
    self.model_class = ::MusicalWork
    self.terms += [:resource_type]
  end
end
