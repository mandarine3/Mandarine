class Post < ActiveRecord::Base
    has_many :replies # dependent: :destroy
    belongs_to :user
    has_many :likes
    has_many :liked_users, :through => :likes, source: :user #??임으로 만든 변수 likes를 통해서 유저를 가져오니라. 그리고 그걸 라이트드 ㅇ저로 하자

    validates :title , presence: true  #title이 있어야만 글이 쓰이게끔 발리데이션 넣어준 것!
end
