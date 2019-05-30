require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    stores: Field::HasMany,
    reviews: Field::HasMany,
    messages: Field::HasMany,
    conversations: Field::HasMany,
    id: Field::Number,
    email: Field::String,
    encrypted_password: Field::String,
    reset_password_token: Field::String,
    reset_password_sent_at: Field::DateTime,
    remember_created_at: Field::DateTime,
    name: Field::String,
    store_name: Field::String,
    area_code: Field::String,
    phone_1: Field::String,
    phone_2: Field::String,
    address: Field::String,
    city: Field::String,
    state: Field::String,
    country: Field::String,
    sub_tier: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    user_type: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :name,
    :email,
    :stores,
    :reviews,
    :conversations,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :name,
    :email,
    :stores,
    :reviews,
    :messages,
    :conversations,
    :store_name,
    :area_code,
    :phone_1,
    :phone_2,
    :address,
    :city,
    :state,
    :country,
    :sub_tier,
    :created_at,
    :updated_at,
    :user_type,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :stores,
    :reviews,
    :messages,
    :conversations,
    :email,
    :encrypted_password,
    :reset_password_token,
    :reset_password_sent_at,
    :remember_created_at,
    :name,
    :store_name,
    :area_code,
    :phone_1,
    :phone_2,
    :address,
    :city,
    :state,
    :country,
    :sub_tier,
    :user_type,
  ].freeze

  # Overwrite this method to customize how users are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(user)
  #   "User ##{user.id}"
  # end
end
