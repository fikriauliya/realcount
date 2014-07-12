class PagesController < ApplicationController
  def home
    if user_signed_in?
      redirect_to new_crowd_input_path
    end
    @count_prabowo = CrowdInput.sum(:prabowo_count)
    @count_jokowi = CrowdInput.sum(:jokowi_count)
    @count_broken = CrowdInput.sum(:broken_count)
    @global_progress = CrowdInput.count()

    @top_contributors = CrowdInput.select("user_id as user_id, count(user_id) as amount").group(:user_id).order("amount DESC").limit(10)
  end
end
