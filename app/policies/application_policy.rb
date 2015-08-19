class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def scope
    record.class
  end

  private

  def record_exists?
    scope.where(id: record.id).exists?
  end
end
