class CategoryPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
  
  def rails_admin?(action)
=begin
     case action
     when :destroy, :new
        false
     else
        super
      end
=end
  end
end
