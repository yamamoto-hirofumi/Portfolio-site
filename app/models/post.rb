class Post < ApplicationRecord
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  attachment :image
  validates :title, length: { maximum: 50 }, presence: true
  validates :content, length: { maximum: 150 }, presence: true
end
