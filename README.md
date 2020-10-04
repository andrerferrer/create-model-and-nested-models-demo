# GOAL

This is a demo to show-case how to create a model and a nested model (or several nested models) in the same form in a rails app.

It was created from [this repo](https://github.com/andrerferrer/create-multiple-tags-demo#goal).

[You can also check my other demos](https://github.com/andrerferrer/dedemos/blob/master/README.md#ded%C3%A9mos).

## What needs to be done?

### 1. In the model `app/models/restaurant.rb`

We need to add `accepts_nested_attributes_for :models`:

```ruby
class Restaurant < ApplicationRecord

  # [...] The rest of the code comes before it
  has_many :tags, through: :restaurant_tags
  accepts_nested_attributes_for :tags

end

```

### 2. In the controller `app/controllers/restaurants_controller.rb`

We need to build the tags for the form:

```ruby
  def new
    @restaurant = Restaurant.new
    @restaurant.tags.build
  end
```

We also need to adjust the strong_params:

```ruby
  def strong_params
    params.require(:restaurant)
          .permit(Restaurant::STRONG_PARAMS, tags_attributes: [ :name ]) #We need to add the tags attributes
  end
```

### 3. In the view `app/views/restaurants/new.html.erb`

We need to make the form ready for it:

```erb
    <%= f.simple_fields_for :tags do |tag_form| %>
      <%= tag_form.input :name, label: "Tag Name" %>
    <% end %>
```

And we're good to go 🤓

Good Luck and Have Fun
