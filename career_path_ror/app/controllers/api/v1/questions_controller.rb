class Api::V1::QuestionsController < ApiController
  def index
    questions = Question.all
    response_sucess(questions)
  end
end