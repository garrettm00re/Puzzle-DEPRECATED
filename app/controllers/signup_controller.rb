class SignupController < ApplicationController
  #def index
  #  @universities = {}
  #  signups.each do |s|
  #    if s.university in @universities
  #end
  def index
    #request.remote_ip ###gets IP address of client (supposedly)
    puts 'hello'
    @universities = Signup.group(:university).order('count_all DESC').count ## what does this return? 
    puts @universities
    #puts 'nn plz'
    #params[:universities] = @universities
  end

  def new
    @signup = Signup.new
  end

  def create
    #Parameters: {"authenticity_token"=>"[FILTERED]", "signup"=>{"name"=>"Garrett Tyler Moore", "email"=>"garrettmoore@berkeley.edu", "university"=>"ligma balls"}, "commit"=>"Submit"}
    puts 'WOOO HOOOOO'
    @signup = Signup.new(signup_params)
    if valid_signup? && @signup.save
      @universities = Signup.group(:university).order('count_all DESC').count
      #puts @universites
      flash[:notice] = 'Thank you for signing up!'
      #@universities = params[:universities]
      #puts flash[:notice]
      #puts params[:universities]
      #puts @universities
      #puts 'not nil?'

      render "signup/index"
    else
      flash[:notice] = 'Error AAAA'
      render :index
    end
  end

  private

  def signup_params
    params.require(:signup).permit(:name, :email, :university)
  end

  def valid_signup?
    # Check if the university and email are valid
    #return false unless university_valid? && email_valid? ##### commented out for testing purposes
   
    # Check if they are not already in the database
    #return false if Signup.exists?(university: @signup.university, email: @signup.email) ##### commented out for testing purposes
    true
  end
  
  def university_valid?
    # Add validation logic for university here
    # Return true if university is valid, otherwise false
  end
  
  def email_valid?
    # Add validation logic for email here
    # Return true if email is valid, otherwise false
  end
  
end