class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :medium do
    process resize_to_fill: [1080, 1080]
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end
end
