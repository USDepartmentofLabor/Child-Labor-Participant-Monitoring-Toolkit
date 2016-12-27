class LocalesController < ApplicationController
  def index
    @locales = Locale.all
  end
end
