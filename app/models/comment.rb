# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :integer
#  photo_id   :integer
#
class Comment < ApplicationRecord
  # Validations
  validates(:photo_id, { :presence => true })
  validates(:body, { :presence => true })
  validates(:author_id, { :presence => true })

  # Direct associations
  belongs_to(:commenter, { :required => false, :class_name => "User", :foreign_key => "author_id" })
  
  belongs_to(:photo, { :required => false, :class_name => "Photo", :foreign_key => "photo_id", :counter_cache => true })
  
end
