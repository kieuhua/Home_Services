class Comment < ApplicationRecord
   
   # with optional: true, it will create comment record w/o commetable_type, commetable_id
   #belongs_to :commentable, polymorphic: true, optional: true
  
   belongs_to :commentable, polymorphic: true
   has_many :comments, as: :commentable
   
   default_scope ->{ order('created_at DESC') }
   
   validates_presence_of :title
   validates_presence_of :description
   
end
