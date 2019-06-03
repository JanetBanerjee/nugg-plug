class StoresController < ApplicationController
  before_action :store_params, only: [:edit, :update]

  def index
    @store = Store.where(approval: "true")

    @rating = Review.all

    @search= Store.search(params[:search]) if params[:search].present?
  end

  def support
    session[:conversations] ||= []

    @users = User.all.where.not(id: current_user)
    @conversations = Conversation.includes(:recipient, :messages)
                         .find(session[:conversations])
  end

  def vendor
    @tier = Payment.new
  end

  def dispensary
    @store = Store.where(store_type: "dispensary")
  end

  def delivery
    @store = Store.where(store_type: "delivery")
  end

  def brand
    @store = Store.where(store_type: "brand")
  end

  def service
    @store = Store.where(store_type: "service")
  end

  def new
    @store = Store.new
  end

  def create
    @store = Store.new(params.required(:store).permit(
                                                  :name, :website, :email,
                                                  :address, :city, :state, :zip, :country,
                                                  :phone_1,
                                                  :description,
                                                  :image, :thumb,
                                                  :mon_open, :mon_end, :mon_closed,
                                                  :tues_open, :tues_end, :tues_closed,
                                                  :wed_open, :wed_end, :wed_closed,
                                                  :thurs_open, :thurs_end, :thurs_closed,
                                                  :fri_open, :fri_end, :fri_closed,
                                                  :sat_open, :sat_end, :sat_closed,
                                                  :sun_open, :sun_end, :sun_closed))

    @store.user_id = current_user.id

    @coord = [@store.address, @store.city, @store.state, @store.zip, @store.country].compact.join(', ')
    results = Geocoder.search(@coord)
    @store.latitude = results.first.latitude
    @store.longitude = results.first.longitude

    gibbon = Gibbon::Request.new(api_key: "486d3d12cc746c2c9cc5200846859494-us20")
    gibbon.lists("fb528460e2").members.create(body: {email_address: @store.email, status: "subscribed", merge_fields: {FNAME: @store.name}})

    if @store.save!
      redirect_to store_created_path
    else
      render :new
    end
  end

  def edit
    @item = Product.new
  end

  def update
    if @store.update(params.required(:store).permit(
        :name, :website, :email,
        :address, :city, :state, :zip, :country,
        :area_code, :phone_1, :phone_2,
        :description,
        :image, :thumb,
        :mon_open, :mon_end, :mon_closed,
        :tues_open, :tues_end, :tues_closed,
        :wed_open, :wed_end, :wed_closed,
        :thurs_open, :thurs_end, :thurs_closed,
        :fri_open, :fri_end, :fri_closed,
        :sat_open, :sat_end, :sat_closed,
        :sun_open, :sun_end, :sun_closed))
      redirect_to @store
    else
      render :edit
    end
  end

  def show
    @store = Store.find(params[:id])

    @review = Review.new
    @item = Product.new
  end

  private

  def store_params
    @store = Store.find(params[:id])
  end

end
