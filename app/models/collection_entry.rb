class CollectionEntry < ApplicationRecord
    belongs_to :collection 
    belongs_to :collectionable, polymorphic: true
end