CarrierWave.configure do |config|
   # These permissions will make dir and files available only to the user running
   # the servers
   config.permissions = 0600
   config.directory_permissions = 0700
   config.storage = :file
   
   # This avoids uploaded files from saving to public/ and so
   # they will not be available for public (non-authenticated) downloading
   config.root = Rails.root
   
   # It's a good idea to test your uploaders in isolation. In order to speed up your tests, 
   # it's recommended to switch off processing in your tests, and to use the file storage. 
   # In Rails you could do that by adding an initializer with:
   if Rails.env.test? or Rails.env.cucumber?
      CarrierWave.configure do |config|
         config.storage = :file
         config.enable_processing = false
      end
   end   
end