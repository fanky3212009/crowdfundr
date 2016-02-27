class Project < ActiveRecord::Base
  has_many :rewards
  has_many :pledges
  has_many :users, through: :pledges
  belongs_to :owner, class_name: "User"
  belongs_to :category
  has_many :tags, as: :taggable

  accepts_nested_attributes_for :rewards, reject_if: :all_blank, allow_destroy: true

  def days_left()
    #code
    time_left = self.end_date - Time.now
    (time_left / 1.day).ceil
  end

  def expired?
    (self.end_date - Time.now) <= 0
  end

  def backed(current_user)
    if current_user
      self.pledges.where("user_id = ?", current_user.id) != []
    end
  end

  def delete?
    self.pledges.each { |pledge|
      return false if pledge.amount > 0
    }
    return true
  end

  def project_total
    total = 0
    self.pledges.each {|pledge|
      total += pledge.amount
    }
    total
  end

  def reached_goal?
    self.project_total >= self.goal
  end

end
