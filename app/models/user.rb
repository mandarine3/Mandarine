class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
         has_many :posts
         has_many :replies
         has_many :likes
         has_many :liked_post ,:through => :likes, source: :post
         
      def is_like?(post)#post는 변수명이라서 다른 걸로 변경도 가능.
        Like.find_by(user_id: self.id, post_id: post.id).present?
      end
      #self는 자기 아이디 불러온다.
      #self는 메소드 명이나 메소드 안에서만 쓰기 가능하다.
         
end
