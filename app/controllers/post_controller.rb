class PostController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show] 
  
  def index
    @post = Post.all.reverse #리버스는 컨트롤러에서 하자
  end
  
  def ajaxCall
    count =params[:count].to_i
    @item=Post.all.at(count)
    @return_Value ={
    "id" => @item.id, 
    "user"=> @item.user_id, 
    "title" =>@item.title, 
    "time" => @item.created.at}
    
    render json: @return_Value
  end

  def new
  end

  def create
    uploader = ImageUploader.new
    uploader.store!(params[:image])

    
    @post = Post.new #Post는 모델에서 row를 새로 생성한다는 개념이니깐 대문자로 합시당
    @post.title = params[:input_title]
    @post.content = params[:input_content]
    @post.user_id = current_user.id
    @post.image = uploader.url #이미지 저장 부분
    @post.thumb = uploader.thumb.url
     @post.middle = uploader.middle.url
    @post.save
  
      
    redirect_to "/post/index"
  end

  def update
     @post = Post.find(params[:id])
     @post.title = params[:input_title]
     @post.content = params[:input_content]
     @post.save
     
     redirect_to "/post/show/" + params[:id]
  end

  def edit
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    
    if current_user.id == @post.user_id
      @post.destroy
      redirect_to "/post/index"
    else
      redirect_to "/post/index"
    end
    

  end

  def show
    @post = Post.find(params[:id])
  end
  
  def search
    #여러 개 검색용 
    # Post.where(:title =>"asdsad") #""에 있는 글자락 딱 맞아야지 나오는거임
    if params[:cate] == "1"
     @post= Post.where("title LIKE ?", "%#{params[:q]}%") #비슷한 글이면 찾아라 asdsad가 포함된 글이 나온다. #{}는 문자 보관법이다!
    elsif
      params[:cate] == "2"
      @post= Post.where("content LIKE ?", "%#{params[:q]}%")
     elsif
     params[:cate] == "3"
     @post= Post.where("title LIKE ? OR content LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%") #OR는 둘 중 하나만 걸쳐도 답이 나온다 ㅅㅅ 그리고 "%#{params[:q]}%"도 두개 나와야함
     elsif
     params[:cate] == "4"
     @post = User.where("username LIKE ?", "%#{params[:q]}%").take.posts
     #sunspot이라는 gem 파일로도 검색이 가능합니당.
    end
  end
end
