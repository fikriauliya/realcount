class PagesController < ApplicationController
  def home
    if user_signed_in?
      redirect_to new_crowd_input_path
    end
    ac = CrowdInput.select("tps_id as tps_id, count(tps_id) as amount, min(prabowo_count) as pc, max(prabowo_count), min(jokowi_count) as jc, max(jokowi_count), min(broken_count) as bc, max(broken_count)").group(:tps_id).having("count(tps_id) > 1 and min(prabowo_count) = max(prabowo_count) and min(jokowi_count) = max(jokowi_count) and min(broken_count) = max(broken_count)")
    @count_prabowo = ac.to_a.sum{|a| a.pc}
    @count_jokowi = ac.to_a.sum{|a| a.jc}
    @count_broken = ac.to_a.sum{|a| a.bc}
    @global_progress = CrowdInput.count()

    @top_contributors = CrowdInput.select("user_id as user_id, count(user_id) as amount").group(:user_id).order("amount DESC").limit(10)
  end
end
