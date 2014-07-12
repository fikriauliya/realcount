class PagesController < ApplicationController
  def home
    if user_signed_in?
      redirect_to new_crowd_input_path
    end
  end
end
