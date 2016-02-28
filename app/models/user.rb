class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes["password"] }
  validates :password, confirmation: true, if: -> { new_record? || changes["password"] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes["password"] }

  validates :email, uniqueness: true

  has_many :projects, through: :pledges
  has_many :owend_projects, class_name: "Project", foreign_key: "owner_id"
  has_many :pledges
  has_many :projects, through: :comments
  has_many :comments
  # belongs_to :project


end
