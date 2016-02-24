class Project < ActiveRecord::Base
  has_many :rewards
  has_many :pledges
  belongs_to :user

  accepts_nested_attributes_for :rewards, reject_if: :all_blank, allow_destroy: true

  def days_left()
    #code
    time_left = self.end_date - Time.now
    (time_left / 1.day).ceil
  end

  def backed(current_user)
    self.pledges.where("user_id = ?", current_user.id) != []
  end
end
