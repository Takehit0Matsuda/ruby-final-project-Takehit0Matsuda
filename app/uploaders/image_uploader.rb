class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  if Rails.env.production?
    storage :fog
  else
    storage :file
  end
  
  process resize_to_fit: [500, 500]

  version :thumb do
    process resize_to_fill: [200, 200]
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  
  def extension_whitelist
    %w[jpg jpeg gif png]
  end
end