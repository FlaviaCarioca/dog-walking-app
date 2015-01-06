class Comment < ActiveRecord::Base
	belongs_to :walker
  	belongs_to :user
end
