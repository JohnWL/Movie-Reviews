class Movie < ActiveRecord::Base
  has_attached_file :image, styles: { medium: "400x600#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  
  belongs_to :user
  has_many :reviews
  
end
