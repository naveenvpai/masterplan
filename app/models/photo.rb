class Photo < ApplicationRecord
  #Signals to the Paperclip framework that photo upload functionality is required for this object
  has_attached_file :image
  validates_attachment :image, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
  belongs_to :user
end
