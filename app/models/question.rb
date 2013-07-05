class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  attr_accessible :body, :solved

  validates(:body, presence: true, length: { in: 20..300 })
  validates(:solved, inclusion: { in: [true, false] })

  def self.unsolved(params)
    where(solved: false).paginate(page: params[:page], order: 'created_at DESC',
      per_page: 5)
  end
end
