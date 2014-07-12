class PagesController < ApplicationController
  def home
    if user_signed_in?
      redirect_to new_crowd_input_path
    end
    @count_prabowo = CrowdInput.sum(:prabowo_count)
    @count_jokowi = CrowdInput.sum(:jokowi_count)
    @count_broken = CrowdInput.sum(:broken_count)
    @global_progress = CrowdInput.count()
  end
end
