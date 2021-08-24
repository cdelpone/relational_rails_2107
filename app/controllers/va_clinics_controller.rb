class VaClinicsController < ApplicationController
  def index
    # @va_clinics = VAClinic.all
    @va_clinics = ['VA Clinic 1', 'VA Clinic 2']
  end
end
