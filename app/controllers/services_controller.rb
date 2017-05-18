class ServicesController < ApplicationController

  before_filter :authenticate_user!, except: [:index, :show]
  before_action :find_service, only: [:show, :edit, :update, :destroy]

  def index
    @services = Service.all

    @services = Service.where.not(latitude: nil, longitude: nil)

    @hash = Gmaps4rails.build_markers(@flats) do |service, marker|
      marker.lat service.latitude
      marker.lng service.longitude
      marker.infowindow render_to_string(partial: "/flats/map_box", locals: { service: service })
    end
  end

  def show
    @service = Service.find(params[:id])
    @service_coordinates = { lat: @service.latitude, lng: @service.longitude }
    # @alert_message = "Vous êtes sur le profil de #{@service.pseudo}"
    @hash = Gmaps4rails.build_markers(@flats) do |service, marker|
      marker.lat service.latitude
      marker.lng service.longitude
      marker.infowindow render_to_string(partial: "/flats/map_box", locals: { service: service })
    end
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
    params.require(:service).permit(:pseudo, :city, :country, :cover, :introduction, :content, :tag, :address)
  end
end
