class ChartsController < ApplicationController

  before_filter :sign_in_user

  def show
    charts = current_user.user_groups.map{|ug| ug.charts}.flatten
    @chart = Chart.find_by(name: params[:name])
    @chart_content = @chart.content if @chart.present?
    unless charts.include? @chart
      flash[:notice] = "Non sei autorizzato ad accedere a questa tabella"
      redirect_to root_url
    end
  end

  def chart_user_data
    @chart = Chart.find_by(name: params[:name])
    @chart_users = []
    if @chart.present?
      @chart.user_groups.each do |user_group|
        @chart_users += user_group.users
      end
    end
    render json: @chart_users
  end
end