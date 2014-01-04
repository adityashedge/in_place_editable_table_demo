class Album < ActiveRecord::Base
  validates :name, presence: true
  validates :year, numericality: true
end
