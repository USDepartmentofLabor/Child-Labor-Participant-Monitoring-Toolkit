class Comment < ActiveRecord::Base
  before_save :add_date

  def set_author user
    self.author = "#{user.name} (#{user.email})"
  end

  private

  def add_date
    self.submitted_at = Time.now
  end
end
