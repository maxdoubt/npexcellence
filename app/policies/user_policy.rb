class UserPolicy < ApplicationPolicy

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
    admin? || own_record?
  end

  def destroy?
    admin? && !own_record?
  end


  #========== ACTIONS ===================================

  def reset?
    destroy?
  end


  #------------------------------------------------------
  # Private Methods
  #------------------------------------------------------
  private

  def own_record?
    record == user
  end

end