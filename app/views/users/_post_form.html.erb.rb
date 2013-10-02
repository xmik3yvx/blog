<%= form_for(@post) do |f| %>
  <%= render 'shared/error_messages', object: f.object %>
  <div class="field">
    <%= f.text_area :content, placeholder: "Write new post" %>
  </div>
  <%= f.submit "Post", class: "btn btn-large btn-primary" %>
<% end %>