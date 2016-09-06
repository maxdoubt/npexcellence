class UserMailer < ActionMailer::Base
  def account_created(user)
    @title = Setting.instance.title
    @user  = user

    mail to: @user.email, from: 'support@npexcellence.com', subject: "Validate the account created for #{@user.email}"
  end


  def account_confirmed(user)
    @title = Setting.instance.title
    @user  = user

    mail to: @user.email, from: 'support@npexcellence.com', subject: "Thankyou for validating your account for #{@user.email}"
  end

end
