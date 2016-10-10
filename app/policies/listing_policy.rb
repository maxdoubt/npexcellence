class ListingPolicy < ApplicationPolicy

  #------------------------------------------------------
  # Public Methods
  #------------------------------------------------------

  #========== VERBS =====================================

  def show?
    admin?
  end

  def create?
    admin?
  end

  def update?
    admin?
  end

  def destroy?
    admin?
  end

end