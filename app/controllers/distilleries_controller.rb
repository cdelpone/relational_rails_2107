class DistilleriesController < ApplicationController
  def index
    # @distilleries = Distillery.all
    @distilleries = ['distillery 1', 'distillery 2']
  end
end
