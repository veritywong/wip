module Attachable
    extend ActiveSupport::Concern

    included do
        def attach_image(image_file)
            self.images.attach(io: File.open("app/assets/images/#{image_file}"), filename: "#{image_file}", content_type: 'image/jpg')
        end
    end

    class_methods do
        
    end
end