class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :content, :personality_id
end
