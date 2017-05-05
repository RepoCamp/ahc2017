# Generated via
#  `rails generate hyrax:work MusicalWork`

module Hyrax
  class MusicalWorksController < ApplicationController
    # Adds Hyrax behaviors to the controller.
    include Hyrax::WorksControllerBehavior
    include Hyrax::BreadcrumbsForWorks
    self.curation_concern_type = ::MusicalWork
  end
end
