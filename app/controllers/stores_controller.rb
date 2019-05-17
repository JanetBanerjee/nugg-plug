class StoresController < ApplicationController
  before_action :store_params, only: [:edit, :update]

  def index
    @store = Store.all
  end

  def support
    session[:conversations] ||= []

    @users = User.all.where.not(id: current_user)
    @conversations = Conversation.includes(:recipient, :messages)
                         .find(session[:conversations])
  end

  def add_product

  end

  def new
    @store = Store.new
  end

  def create
    @store = Store.new(params.required(:store).permit(
                                                  :name,
                                                  :address, :city, :state, :zip, :country,
                                                  :area_code, :phone_1, :phone_2,
                                                  :description,
                                                  :image,
                                                  :mon_open, :mon_end, :mon_closed,
                                                  :tues_open, :tues_end, :tues_closed,
                                                  :wed_open, :wed_end, :wed_closed,
                                                  :thurs_open, :thurs_end, :thurs_closed,
                                                  :fri_open, :fri_end, :fri_closed,
                                                  :sat_open, :sat_end, :sat_closed,
                                                  :sun_open, :sun_end, :sun_closed))

    @store.name = current_user.name
    @store.user_id = current_user.id

    if @store.save!
      redirect_to store_path(@store)
    else
      render :new
    end

  end

  def edit
    @item = Product.new
  end

  def update
    if @store.update(params.required(:store).permit(
        :name,
        :address, :city, :state, :zip, :country,
        :area_code, :phone_1, :phone_2,
        :description,
        :image,
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
