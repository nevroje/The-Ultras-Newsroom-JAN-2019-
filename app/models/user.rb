class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: {visitor: 0, journalist: 1, editor: 2}
end
