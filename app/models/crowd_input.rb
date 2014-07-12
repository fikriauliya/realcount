class CrowdInput < ActiveRecord::Base
  belongs_to :tps
  belongs_to :user
  validates :prabowo_count, :jokowi_count, :broken_count, inclusion: { in: 0..1000 }

  self.per_page = 10

  def c1_url
    return tps.c1_url
  end
end
