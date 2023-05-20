class Admin::PostsController < ApplicationController
  before_action :authenticate_admin! # Ensure the user is an admin before accessing these actions

end
