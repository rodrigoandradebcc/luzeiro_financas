class OperationPolicy
  attr_reader :user, :operation

  def initialize(user, operation)
    @user = user
    @operation = operation
  end

  def destroy?
    operation.unauthorized? or user.admin?
  end

  def authorize_operation?
    user.admin? 
  end
end
