class Blog < ApplicationRecord
  belongs_to :user
  
  mount_uploader :image, ImageUploader
  validates :content,
    length: {in: 0..63206}  
  validates :content, presence: true, if: :image?
  validates :image, presence: true, if: :content?
  
  private
  def image?
    self.image == ""
  end
  def content?
    self.content == ""
  end
end
