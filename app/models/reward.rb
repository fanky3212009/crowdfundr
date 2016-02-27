class Reward < ActiveRecord::Base
  belongs_to :project
  belongs_to :pledge
  has_many :tags, as: :taggable
end
