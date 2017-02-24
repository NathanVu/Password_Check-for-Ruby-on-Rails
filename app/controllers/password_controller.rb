class PasswordController < ApplicationController

  def check
    @user =  params[:user] unless params[:user].nil?
    @password =  params[:password] unless params[:password].nil?

    # When the page loads for the first time and no user or password exists (empty form), tell the user to fill out the form
    if @user.nil? && @password.nil?
      flash.now[:alert] = "Fill out username and password"
        # Username must be more than 6 letters
      #length for username and password is longer than 6
      elsif @user.length >= 6 && @password.length >= 6 && (@user != @password)
        flash.now[:alert] = "Username & Password valid"
        # User name cannot include  !,#,@,$ special characters

      elsif (@user.include? "!") ||
        (@user.include? "#") ||
        (@user.include? "$") ||
        (@user.include? "@") ||
        (@user.include? " ")
        flash.now[:alert] = "Username name is valid"

        #password cannot equal password

      elsif (@password.include? "!") ||
        (@password.include? "#") ||
        (@password.include? "$") ||
        (@password.include? "@") ||
        (@password.include? " ") ||
        (@password.include? "0") ||
        (@password.include? "1") ||
        (@password.include? "2") ||
        (@password.include? "3") ||
        (@password.include? "4") ||
        (@password.include? "5") ||
        (@password.include? "6") ||
        (@password.include? "7") ||
        (@password.include? "8") ||
        (@password.include? "9")
        flash.now[:alert] = "Password is valid"
      elsif @password == ("Password") || ("password") || ("PASSWORD")
        flash.now[:alert] = "Password is not valid"
      else
        flash.now[:alert] = "Password is not valid."
        render "check.html.erb"
      end
  end
end
