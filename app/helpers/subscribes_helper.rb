require 'pry'

module SubscribesHelper
  def activity_name(id)
    Activity.find(id).name
  end
end
