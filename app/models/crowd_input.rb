class CrowdInput < ActiveRecord::Base
  belongs_to :tps
  belongs_to :user

  def c1_url
    return tps.c1_url
  end
end
