class WikiPolicy < ApplicationPolicy

  def show?
    record.public? || user.present?
  end

  def edit?
    update?
  end

  def update?
    (!record.private && user.present?) || record.user == user || user.admin?
  end

  def make_private?
    user_is?('premium', 'admin')
  end
end

class Scope
  attr_reader :user, :Scope

  def initialize(user, scope)
    @user = user
    @scope = scope
  end
end
