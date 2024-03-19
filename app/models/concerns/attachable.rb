module Attachable # could rename it to be clearly an image attached, or not make it a concern
    extend ActiveSupport::Concern

    included do
        def attach_local_image(image_file)
            self.images.attach(io: File.open("app/assets/images/#{image_file}"), filename: "#{image_file}", content_type: 'application/jpg') # if self.respond to images?
        end

        def attach_image_url(image_url, image_name)
            image = URI.open(image_url)
            self.images.attach(io: image, filename: "#{image_name}.jpg")
        end

        def attach_exhibition_image(image_url, image_name)
            image = URI.open(image_url)
            self.promo_image.attach(io: image, filename: "#{image_name}.jpg")
        end
        
        def attach_local_pdf(pdf_file)
            self.pdfs.attach(io: File.open("app/assets/pdfs/#{pdf_file}"), filename: "#{pdf_file}", content_type: 'application/pdf')
        end
    end

    class_methods do
        
    end
end

# would you be wanting an attachable pdf?
# could have attach_pdf, look for the accessors on the class and attach only if the model has that as an attachable 