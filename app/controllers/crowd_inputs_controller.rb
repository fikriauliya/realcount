class CrowdInputsController < ApplicationController
  before_action :set_crowd_input, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /crowd_inputs
  # GET /crowd_inputs.json
  def index
    @crowd_inputs = CrowdInput.paginate(:page => params[:page])
  end

  # GET /crowd_inputs/new
  def new
    unless current_user.is_banned
      @crowd_input = CrowdInput.new
      @crowd_input.tps_id = Tps.random_id
      @crowd_input.prabowo_count = 0
      @crowd_input.jokowi_count = 0
      @crowd_input.broken_count = 0

      initialize_variables
    else
      render :text => "Anda telah diblokir"
    end
  end

  # POST /crowd_inputs
  # POST /crowd_inputs.json
  def create
    unless current_user.is_banned
      @crowd_input = CrowdInput.new(crowd_input_params)
      @crowd_input.user_id = current_user.id

      respond_to do |format|
        if @crowd_input.save
          format.html { redirect_to new_crowd_input_path, notice: 'Your previous input was successfully added.' }
          format.json { render :show, status: :created, location: @crowd_input }
        else
          format.html {
            initialize_variables()
            render :new
          }
          format.json { render json: @crowd_input.errors, status: :unprocessable_entity }
        end
      end
    else
      render :text => "Anda telah diblokir"
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

  def initialize_variables
    @my_progress = CrowdInput.where(:user_id => current_user.id).count()
    @global_progress = CrowdInput.count()
    # @count_prabowo = CrowdInput.sum(:prabowo_count)
    # @count_jokowi = CrowdInput.sum(:jokowi_count)
    # @count_broken = CrowdInput.sum(:broken_count)

    ac = CrowdInput.select("tps_id as tps_id, count(tps_id) as amount, min(prabowo_count) as pc, max(prabowo_count), min(jokowi_count) as jc, max(jokowi_count), min(broken_count) as bc, max(broken_count)").group(:tps_id).having("count(tps_id) > 1 and min(prabowo_count) = max(prabowo_count) and min(jokowi_count) = max(jokowi_count) and min(broken_count) = max(broken_count)")
    @count_prabowo = ac.to_a.sum{|a| a.pc}
    @count_jokowi = ac.to_a.sum{|a| a.jc}
    @count_broken = ac.to_a.sum{|a| a.bc}

    @top_contributors = CrowdInput.select("user_id as user_id, count(user_id) as amount").group(:user_id).order("amount DESC").limit(10)
    @banned_users = User.where(:is_banned => true)
  end
end
