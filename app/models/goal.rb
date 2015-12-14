class Goal < ActiveRecord::Base
  has_many :notes
  belongs_to :user
  validates :user_id, presence: true
end
