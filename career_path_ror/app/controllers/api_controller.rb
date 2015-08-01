class ApiController < ApplicationController
  before_action :authenticate_with_token!
end