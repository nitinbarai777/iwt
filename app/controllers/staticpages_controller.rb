class StaticpagesController < ApplicationController

  before_filter :sign_in_user

  skip_before_filter :authenticate_user!, only: [:index, :regolamento]

  def index
  end

  def regolamento
  end
  
end
