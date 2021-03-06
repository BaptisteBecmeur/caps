class ServicesController < ApplicationController

  before_filter :authenticate_user!, except: [:index, :show]
  before_action :find_service, only: [:show, :edit, :update, :destroy]

  def index
    @services = Service.all
  end

  def show
    # @alert_message = "Vous êtes sur le profil de #{@service.pseudo}"
  end

  def new
    @service = Service.new
  end

  def create
    @service = current_user.services.new(service_params)
      if @service.save
        redirect_to @service
      else
        render :new
      end
  end

  def edit
  end

  def update
    if @service.update(service_params)
      redirect_to @service
    else
      render :edit
    end
  end

  def destroy
    @service.destroy
    redirect_to :back
  end

  private

  def find_service
    @service = Service.find(params[:id])
  end

  def service_params
    params.require(:service).permit(:pseudo, :city, :country, :cover, :introduction, :content, :tag)
  end
end
