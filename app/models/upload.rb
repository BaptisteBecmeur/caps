class Upload < ApplicationRecord
  belongs_to :service



  validates :photo, presence: true
  mount_uploader :photo, PhotoUploader
end
