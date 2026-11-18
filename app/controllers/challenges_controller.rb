class ChallengesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index ]
  def index
    @challenges = Challenge.all
    # format is the type of request: html, json, turbo
    respond_to do |format|
      format.html { render 'index' }
      format.json { render json: @challenges }
    end
  end

  def show
    @challenge = Challenge.find(params[:id])
    @chats = @challenge.chats.where(user: current_user)
  end
end
