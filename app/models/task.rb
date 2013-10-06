class Task < ActiveRecord::Base
  attr_accessible :title, :estimated_pomodoros
  belongs_to :project

  default_scope order('done ASC')
end
