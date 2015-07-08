class Idea < ActiveRecord::Base
  validates :title, presence: true,
                    uniqueness: true
  validates :body, presence: true

  default_scope { order(updated_at: :desc) }

  enum quality: { swill: 0, plausible: 1, genius: 2 }

  def thumbs_up
    if self.quality == "swill"
      self.quality = "plausible"
    else
      self.quality = "genius"
    end
  end

  def thumbs_down
    if self.quality == "genius"
      self.quality = "plausible"
    else
      self.quality = "swill"
    end
  end
end
