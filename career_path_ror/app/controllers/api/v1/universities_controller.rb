class Api::V1::UniversitiesController < ApiController
  def index
    questions = Question.all
    response_sucess(questions)
  end
end