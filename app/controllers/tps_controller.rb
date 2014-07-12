class TpsController < ApplicationController
  before_action :set_tp, only: [:show, :edit, :update, :destroy]

  # GET /tps
  # GET /tps.json
  def index
    @tps = Tps.all
  end

  # GET /tps/1
  # GET /tps/1.json
  def show
  end
end
