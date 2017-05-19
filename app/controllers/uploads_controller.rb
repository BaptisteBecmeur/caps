class UploadsController < ApplicationController

  before_filter :authenticate_user!
  before_action :set_service, only: [:show, :new, :create, :destroy]

  def show
    @upload = Upload.find(params[:id])
  end

  def index
    @uploads = Upload.all
  end

  def create

    @upload = @service.uploads.new(upload_params)
    if @upload.save
      redirect_to @service
    else
      render 'uploads/show'
    end
  end

  def new
    @upload = Upload.new
  end

  def edit
  end

  def update
  end

  def destroy
    @upload = Upload.find(params[:id])
    @upload.destroy
    redirect_to service_path(@service)
  end

  private


  def set_service
    @service = Service.find(params[:service_id])
  end

  def upload_params
    params.require(:upload).permit(:description, :title, :photo, :service_id)
  end
end






