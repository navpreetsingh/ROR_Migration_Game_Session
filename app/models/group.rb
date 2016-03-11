class Group < ActiveRecord::Base
	has_many :users
	has_and_belongs_to_many :channels
	has_many :products, through: :channels
end
