class AttractionPolicy < ApplicationPolicy

  def create?
    binding.pry
    user.admin
  end

end