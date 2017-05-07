require 'date'

namespace :mailer do
  desc "TODO"
  task welcome: :environment do
    tomorrow_date = 1.day.from_now
    all_subs =Subscribe.where(chosen_date:tomorrow_date)
    binding.pry
      all_subs.each do |sub|
        puts sub.user.email
        UserMailer.welcome_email(sub).deliver
      
    end
  end
end
