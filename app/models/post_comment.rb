class PostComment < ActiveRecord::Base
  belongs_to :post
  attr_accessible :body, :email, :name, :post, :post_id 
  validates_presence_of :name
  validates_length_of :name, :within=>2 ..20
  validates_presence_of :body
end
