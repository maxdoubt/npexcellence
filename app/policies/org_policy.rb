class OrgPolicy < ApplicationPolicy

  #------------------------------------------------------
  # Public Methods
  #------------------------------------------------------

  #========== VERBS =====================================

  def show?
    user
  end

  def create?
    admin? or employee?
  end

  def update?
    (admin? or employee?) or own_record?
  end

  def destroy?
    admin?
  end

  #------------------------------------------------------
  # Private Methods
  #------------------------------------------------------
  private

  def own_record?
    record == user.org
  end

end