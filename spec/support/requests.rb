module Requests
  def sign_in_as(user)
    allow_any_instance_of(ApplicationController).to \
      receive(:authenticate_user!).and_return(user)
    allow_any_instance_of(ApplicationController).to \
      receive(:current_user).and_return(user)
  end
end
