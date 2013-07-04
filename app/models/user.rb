class User < ActiveRecord::Base
  has_many :questions
  attr_accessible :username, :password, :password_confirmation
  has_secure_password

  validates(:username, presence: true,
    uniqueness: { case_sensitive: false },
    length: { in: 4..12 },
    format: { with: /^[a-z][a-z0-9]*$/,
      message: 'Can only contain lowercase letters and numbers' })

  validates(:password, length: { in: 5..9 })

  def your_questions(params)
    questions.paginate(page: params[:page], order: 'created_at DESC', per_page: 5)
  end
end
