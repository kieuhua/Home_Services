module CategoriesHelper
   def list_sub_by_category_id(id)
      @category = Category.find(id)
      if !@category.subcategories.empty?
         @list = []
         @category.subcategories.each do |sub|
            @list << sub.subname
         end
         @list
      else
         'There is no subcategory in this #{@catgory}'  
      end 
   end
end
