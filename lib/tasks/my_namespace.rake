namespace :my_namespace do
  desc "TODO"
  task my_task: :environment do
    UserMailer.welcome_email(1).deliver
  end

end
