class AvatarUploader < CarrierWave::Uploader::Base
   include Uploader
   include CarrierWave::RMagick
   
   # default file will be in public/uploads dir
   # or store_dir method to change dir
   # make sure you put dir in .gtignore
   storage :file
   
   # create bigger version to small version, better performance
   version :thumb do
     process resize_to_fill: [350, 350]
   end
   version :small_thumb, from_version: :thumb do
      process resize_to_fill: [20, 20]
   end
   
   # Override the directory where uploaded files will be stored.
   # This is a sensible default for uploaders that are meant to be mounted:
   # k in public/uploads
   def store_dir
      #  assets/images/uploads create home_service/assets/images/uploads dir, not using app/assets/images
      # images/uploads => home_service/images/uploads
      # /app/assets/images => permision denied
      #"public/uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
      # uploads/ => public/uploads
      #"public/uploads/images"
      # assets/images => homeserver/assets/images
      #"assets/images/uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
      
      # this create homeservice/app/assests/images/...
       Rails.root + "app/assets/images/uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
   end
   
   # Add a white list of extensions which are allowed to be uploaded.
   # For images you might use something like this:
   def extension_white_list
      %w(jpg jpeg gif png)
   end
   
   def content_type_whitelist
      /image\//
   end
   
   # Override the filename of the uploaded files:
   # Avoid using model.id or version_name here, see uploader/store.rb for details.
   def filename
      "#{secure_token}.#{file.extension}" if original_filename
   end
end