module ApplicationHelper

  def login_form
    concat flash[:alert] unless flash[:alert].nil?
    form_for :user, url: '/login' do |f|
      concat f.label :handle, "Username"
      concat f.text_field :handle
      concat tag :br
      concat f.label :password
      concat f.password_field :password
      concat tag :br
      concat f.submit "Login"
    end
  end

end
