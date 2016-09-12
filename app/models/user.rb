class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # include ActionView::Helpers::TagHelper
  
  has_many :relationships
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
