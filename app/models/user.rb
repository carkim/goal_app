class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_many :goals, dependent: :destroy
  validates_confirmation_of :password, message: "should match confirmation", if: :password
end
