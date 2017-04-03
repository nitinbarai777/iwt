class CitiesController < ApplicationController


  before_filter :sign_in_user
  
  skip_before_filter :authenticate_user!, only: [:show]

  def show
    @city = City.find_by(name: params[:name])
    redirect_to root_url unless @city.present?
  end

end
