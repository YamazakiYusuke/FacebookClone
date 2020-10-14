class Blog < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :content,
    length: {in: 0..63206}  
  end
  belong_to :user
end
