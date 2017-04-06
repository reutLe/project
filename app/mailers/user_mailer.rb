class UserMailer < ApplicationMailer
  default from: 'ymbuild@gmail.com'

  def welcome_email(subscribe)
    @subscribe = subscribe
    @user = subscribe.user
    @activity = subscribe.activity
    @url  = "http://0.0.0.0:3000" + activity_url(@activity, :only_path => true)
    mail(to: @user.email, subject: 'Welcome to buildYM')
  end
end
