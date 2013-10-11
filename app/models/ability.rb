class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :read, :all
    if user.persisted?
      can :manage, Album do |album|
        album.user_id == user.id
      end
      can :manage, Photo do |photo|
        photo.album.user == user
      end
      can :create, Photo do |photo|
        photo.album.user == user
      end
    end
  end
end
