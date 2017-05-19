# encoding: utf-8

# app/uploaders/photo_uploader.rb
class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  # def public_id
  #   if model.try(:title)
  #     return model.title.parameterize
  #   else
  #     return model.object_id
  #   end
  # end
end
