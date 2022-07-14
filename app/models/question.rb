class Question < ApplicationRecord
  validates :body, presence: true,
  length: { 
    maximum: 280,
    too_long: "error. Maximum length of message is 280"
  }
end
