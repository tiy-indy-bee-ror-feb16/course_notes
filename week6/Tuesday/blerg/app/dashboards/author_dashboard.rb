require "administrate/base_dashboard"

class AuthorDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    authorships: Field::HasMany,
    posts: Field::HasMany,
    comments: Field::HasMany,
    reps: Field::HasMany.with_options(class_name: "Comment"),
    commented_on_posts: Field::HasMany.with_options(class_name: "Post"),
    id: Field::Number,
    name: Field::String,
    bio: Field::Text,
    active: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    posts_count: Field::Number,
    word_count: Field::Number,
    password_digest: Field::String,
    role: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :name,
    :posts,
    :word_count,
    :comments,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :posts,
    :name,
    :bio,
    :active,
    :created_at,
    :word_count,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :name,
    :bio,
    :role,
  ].freeze

  # Overwrite this method to customize how authors are displayed
  # across all pages of the admin dashboard.
  #
   def display_resource(author)
     author.name
   end
end
