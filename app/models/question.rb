class Question < ActiveRecord::Base
  belongs_to :user
  attr_accessible :body, :solved

  validates(:body, presence: true, length: { in: 20..300 })
  validates(:solved, inclusion: { in: [true, false] })
end
