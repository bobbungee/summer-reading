class Category < ActiveRecord::Base
  belongs_to :course
  has_many :novels, :dependent => :destroy
end
