class Project < ActiveRecord::Base
  attr_accessible :name
  has_many :tasks

  def task_count
    tasks.where("done = ?", false).count
  end
end
