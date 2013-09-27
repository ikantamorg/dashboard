class ImageUploader < CarrierWave::Uploader::Base
  include Sprockets::Helpers::RailsHelper
  include Sprockets::Helpers::IsolatedHelper

  include Cloudinary::CarrierWave
  
  process :tags => ["photo_album_sample"]
  process :convert => "jpg"

  version :thumbnail do
    eager
    resize_to_fit(150, 150)
    ik_transformation :quality => 80          
  end  

end
