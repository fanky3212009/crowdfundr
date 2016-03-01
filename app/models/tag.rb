class Tag < ActiveRecord::Base
  belongs_to :taggable, polymorphic: true

  def self.projects(name) 
    project_ids = where(taggable_type: 'Project', name: name).pluck(:taggable_id).uniq
    Project.where(id: project_ids)
  end
end
