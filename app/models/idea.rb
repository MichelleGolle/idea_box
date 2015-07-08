class Idea < ActiveRecord::Base
  validates :title, presence: true
  validates :body, presence: true
  enum quality: %w(swill plausible genius)

  def thumbs_up
    if self.quality == 0
      self.quality = 1
    else
      self.quality = 2
    end
  end

  def thumbs_down
    if quality == 2
      quality = 1
    else
      quality = 0
    end
  end
end
