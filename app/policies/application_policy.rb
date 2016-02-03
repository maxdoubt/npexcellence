class ApplicationPolicy
  attr_reader :user, :record

  #========== CONSTRUCTION ==============================

  def initialize(user, record)
    @user   = user
    @record = record
  end


  #========== ACTIONS ===================================

  def index?
    false
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end


  #========== SCOPES ====================================

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end


  #------------------------------------------------------
  # Private Methods
  #------------------------------------------------------
  private

  def admin?
    user.admin?
  end

  def user?
    user.user?
  end

end
