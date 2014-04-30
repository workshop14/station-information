class StationsController < ApplicationController
  respond_to :json
  
  def show
    respond_with Station.all
  end
end
