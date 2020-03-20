class Post < ApplicationRecord
	belongs_to :blogger
	belongs_to :destination

	validates :blogger, presence: true
	validates :destination, presence: true
	validates :title, presence: true
	validates :content, length: { minimum: 101 }
end
