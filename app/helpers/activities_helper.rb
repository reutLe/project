module ActivitiesHelper

  def show_owner(id)
    User.find(id).username
  end
end
