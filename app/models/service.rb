class Service < ApplicationRecord
  belongs_to :user

  mount_uploader :cover, PhotoUploader
end
