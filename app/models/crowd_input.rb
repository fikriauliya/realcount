class CrowdInput < ActiveRecord::Base
  belongs_to :tps
  belongs_to :user

  self.per_page = 10

  def c1_url
    return tps.c1_url
  end
end
