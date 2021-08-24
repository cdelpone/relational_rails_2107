class VAClinicsController < ApplicationController
  def index
    @va_clinics = VAClinic.all
  end
end
