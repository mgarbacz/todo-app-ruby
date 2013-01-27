class Todo < ActiveRecord::Base
  attr_accessible :todo, :done
  validates_presence_of :todo, :done
end
