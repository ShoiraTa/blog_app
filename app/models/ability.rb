class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
    else
      can :create, Post
      can :manage, Post, id: Post.where(user_id: user.id).map(&:id)

      can :create, Comment
      can :manage, Comment, id: Comment.where(user_id: user.id).map(&:id)

      can :read, :all

    end
  end
end
