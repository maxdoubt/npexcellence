class PostPolicy < ApplicationPolicy

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
    admin?
  end

  #------------------------------------------------------
  # Private Methods
  #------------------------------------------------------
  private

  def own_record?
    record.user == user
  end

end