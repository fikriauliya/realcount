class CrowdInputsController < ApplicationController
  before_action :set_crowd_input, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /crowd_inputs
  # GET /crowd_inputs.json
  def index
    @crowd_inputs = CrowdInput.all
  end

  # GET /crowd_inputs/new
  def new
    @crowd_input = CrowdInput.new
    @crowd_input.tps_id = Tps.random_id
    @my_progress = CrowdInput.where(:user_id => current_user.id).count()
    @global_progress = CrowdInput.count()
  end

  # POST /crowd_inputs
  # POST /crowd_inputs.json
  def create
    @crowd_input = CrowdInput.new(crowd_input_params)
    @crowd_input.user_id = current_user.id

    respond_to do |format|
      if @crowd_input.save
        format.html { redirect_to new_crowd_input_path, notice: 'Your previous input was successfully added.' }
        format.json { render :show, status: :created, location: @crowd_input }
      else
        format.html { render :new }
        format.json { render json: @crowd_input.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_crowd_input
      @crowd_input = CrowdInput.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def crowd_input_params
      params.require(:crowd_input).permit(:user_id, :tps_id, :prabowo_count, :jokowi_count, :broken_count, :problem)
    end
end
