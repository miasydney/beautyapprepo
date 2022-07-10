class ListingsController < ApplicationController
  before_action :set_listing, only: %i[ show edit update destroy place_order ]
  before_action :set_form_vars, only: %i[ new edit ]
  before_action :authenticate_user!, except: %i[ index show ]
  before_action :authorize_user, only: %i[ edit update destroy ]

  # GET /listings or /listings.json
  def index
    if params[:listing] and params[:listing][:category_id]
      @listings = Listing.search(params[:listing][:category_id])
    else
      @listings = Listing.all
    end
  end

  # GET /listings/1 or /listings/1.json
  def show
    @listings = Listing.where(booked: false)
  end

  # GET /melbourne or /sydney etc
  def melbourne
    @listings = Listing.where(city_id: 1)
  end
  def sydney
    @listings = Listing.where(city_id: 2)
  end
  def brisbane
    @listings = Listing.where(city_id: 3)
  end
  def goldcoast
    @listings = Listing.where(city_id: 4)
  end
  def perth
    @listings = Listing.where(city_id: 5)
  end
  def adelaide
    @listings = Listing.where(city_id: 6)
  end
  def hobart
    @listings = Listing.where(city_id: 7)
  end
  def geelong
    @listings = Listing.where(city_id: 8)
  end
  def newcastle
    @listings = Listing.where(city_id: 9)
  end

  # GET /listings/new
  def new
    @listing = Listing.new
  end

  # GET /listings/1/edit
  def edit
  end

  # POST /listings or /listings.json
  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user

    respond_to do |format|
      if @listing.save
        format.html { redirect_to listing_url(@listing), notice: "Listing was successfully created." }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1 or /listings/1.json
  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to listing_url(@listing), notice: "Listing was successfully updated." }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1 or /listings/1.json
  def destroy
    @listing.destroy

    respond_to do |format|
      format.html { redirect_to listings_url, notice: "Listing was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def place_order
    Order.create(
      listing_id: @listing.id,
      seller_id: @listing.user_id,
      buyer_id: current_user.id
    )

    @listing.update(booked: true)
    # note to self: add some logic here to only redirect if order successfully placed
    redirect_to orders_success_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    def set_form_vars
      @categories = Category.all
      @cities = City.all
    end

    def authorize_user
     if @listing.user_id != current_user.id
      flash[:alert]= "You can't do that"
      redirect_to listings_path
     end
    end

    # Only allow a list of trusted parameters through.
    def listing_params
      params.require(:listing).permit(:title, :description, :price, :business, :instagram, :booked, :date, :time, :user_id, :category_id, :city_id, :picture)
    end
end
