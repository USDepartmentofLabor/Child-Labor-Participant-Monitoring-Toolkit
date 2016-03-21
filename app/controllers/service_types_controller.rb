class ServiceTypesController < ApplicationController

  # GET /service_types
  def index
    @service_types = ServiceType.order(:name).all
  end

end
