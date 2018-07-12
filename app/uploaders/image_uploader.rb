class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  process :store_dimensions

  if Rails.env.development?
    storage :file
  else
    storage :fog
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def cache_dir
    "#{Rails.root}/tmp/uploads"
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  private

  def store_dimensions
    if file && model
      img = ::Magick::Image::read(file.file).first
      model.image_width = img.columns
      model.image_height = img.rows
    end
  end
end
