class Api::V1::UniversitiesController < ApiController
  def index
    type = params[:type]

    response_sucess(questions)
  end
end