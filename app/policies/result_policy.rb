class ResultPolicy
  attr_reader :user, :result

  def initialize(user, result)
    @user = user
    @result = result
  end

  def create?
    user.admin? 
  end
  
  def show?
    user.admin? 
  end
  def new?
    user.admin? 
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      if user.admin?
        scope.all
      else
        scope = nil
      end
    end
  end

end
