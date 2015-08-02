class Api::V1::UniversitiesController < ApiController

  def index

    type = params[:type].to_i
    list_university = []
    University.all.each do |u|
      if u.careers.include?(type)
        list_university << u
      end
    end
    data = {"universities": list_university}
    response_success_with_data(data)
  end

end