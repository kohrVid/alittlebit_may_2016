class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  

  storage :file

  def root
    File.join(Padrino.root,"public/")
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(jpeg jpg gif png pdf)
  end

end
