class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :projects, through: :pledges
  has_many :pledges
  belongs_to :user

end
