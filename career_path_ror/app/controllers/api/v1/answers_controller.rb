class Api::V1::AnswersController < ApiController
  def create
    results = params[:results]
    puts ">>>>"
    total_result = JSON.parse(results).count
    if total_result == Question.all.size
      response_error("123", 111)
    else
      response_error("xx", 123)
    end
  end
end