class RegionsController < ApplicationController

  # GET /regions
  def index
    @regions = Region.all.map { |r| { value: r.id, text: r.name } }
    render :json => @regions
  end
end
