class Api::V1::AnswersController < ApiController

  def create
    results = JSON.parse(params[:results])
    if results.count == Question.all.size
      answer = Answer.find_by(user_id: current_user.id)
      if answer.nil?
        answer = Answer.create(user_id: current_user.id, results: results)
      else
        answer.update(results: results)
      end
      answers = answer.results
      r = value_of(answers[0..9])
      i = value_of(answers[10..19])
      a = value_of(answers[20..29])
      s = value_of(answers[30..39])
      e = value_of(answers[40..49])
      c = value_of(answers[50..59])
      list_answer = [r, i, a, s, e, c]
      p list_answer
      max_1 = list_answer.rindex(list_answer.max)
      max_value_1 = list_answer[max_1]

      list_answer_2 = list_answer
      list_answer_2.delete_at(max_1)
      max_2 = list_answer_2.rindex(list_answer_2.max)
      max_value_2 = list_answer_2[max_2]

      data = {}
      if  max_value_2 >= 5.0
        majors_1 = {"majors": ["Nghe 1", "Nghe 2", "Nghe 3"]}
        majors_2 = {"majors": ["Nghe 4", "Nghe 5", "Nghe 6"]}
        data = {"results": [majors_1, majors_2]}
      else
        data = {"results": [type: type(max_1)]}
      end

      response_success_with_data(data)
    else
      response_error("xx", 123)
    end
  end

  private
  def value_of(array)
    result = 0
    array.each do |e|
      result += probability(e)
    end
    result
  end

  def probability(value)
    result = 0
    case value
    when 1
      result = 0
    when 2
      result = 0.25
    when 3
      result = 0.5
    when 4
      result = 0.75
    when 5
      result = 1
    end
    result
  end

  def type(value)
    type = nil
    case value
    when 0
      type = PersonalityType.select(:id, :name).find_by(name: "Realistic")
    when 1
      type = PersonalityType.select(:id, :name).find_by(name: "Investigative")
    when 2
      type = PersonalityType.select(:id, :name).find_by(name: "Artistic")
    when 3
      type = PersonalityType.select(:id, :name).find_by(name: "Social")
    when 4
      type = PersonalityType.select(:id, :name).find_by(name: "Enterprising")
    when 5
      type = PersonalityType.select(:id, :name).find_by(name: "Conventional")
    end
    type
  end

end