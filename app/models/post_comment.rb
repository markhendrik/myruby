class PostComment < ActiveRecord::Base
  belongs_to :post
  attr_accessible :body, :email, :name
  validates_presence_of :name
  validates_length_of :name, :within=>2 ..20
  validates_presence_of :body
end
