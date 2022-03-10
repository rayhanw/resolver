FactoryBot.define do
  factory :error do
    title { "undefined method `model_name` for nil:NilClass" }
    details { "Error happens on the line of `simple_form_for [@restaurant, @review]`" }
    resolver {
      "######  In restaurants/show.html.erb
      ```erb
      <%= simple_form_for [@restaurant, @review] do |f| %>
        <!-- [...] -->
      <% end %>
      ```
      ######  In restaurants_controller.rb
      ```rb
      # Check if the variables `@restaurant` or `@review` are defined in the associated controller action (e.g. `show` method)
      # in restaurants_controller.rb, make sure you've defined both variables

      def show
        @restaurant = Restaurant.find(params[:restaurant_id])
        @review = Review.new
      end"
    }
  end
end
