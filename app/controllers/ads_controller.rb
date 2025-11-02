class AdsController < ApplicationController
  before_action :set_ad_authed, only: %i[ edit update destroy ]
  before_action :set_last_page
  after_action :set_previous_path, only: %i[ index show ]

  def index
    @ads = Ad.all
  end

  def show
    @ad = Ad.find(params[:id])
  end

  def new
    @ad = Ad.new
  end

  def create
    @ad = Ad.new(ad_params)
    @ad.user = Current.user

    if @ad.save
      redirect_to @ad
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @ad.update(ad_params)
      redirect_to @ad
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @ad.destroy
    redirect_to ads_path
  end

  private
    def set_ad_authed
      if Current.user == Ad.find(params[:id]).user
        @ad = Ad.find(params[:id])
      else
        redirect_to ads_path, alert: "You are not authorized to edit this ad."
      end
    end
    def set_last_page
      @last_page = session[:previous_path]
    end
    def set_previous_path
      session[:previous_path] = request.path
    end
    def ad_params
      params.expect(ad: [ :name, :ad_image, :description, :selling_price, :pay_per_view ])
    end
end
