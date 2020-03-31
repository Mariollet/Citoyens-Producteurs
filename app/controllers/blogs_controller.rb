class BlogsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_blog, only: [:show, :edit,:update, :destroy]
  before_action :set_img_blog

  def index
    @blogs = Blog.all
    @stores = Store.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      flash[:success] = "Post créé avec succès."
      redirect_to blogs_url
    else
      flash[:danger] = "Le post n'a pas pu être créé, tous les champs doivent être renseignés et le contenu doit être de 40 caractères minimum"
      render new_blog_path
    end
  end

  def show
    @blog_comment = BlogComment.new
  end

  def update
    if @blog.update(blog_params)
      flash[:success] = "Post modifié avec succès."
      redirect_to blogs_url
    else
      flash[:danger] = "Le post n'a pas pu être mmodifié, tous les champs doivent être renseignés"
      render
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path
  end


  private

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def set_img_blog
    @blog_img = ['https://images.pexels.com/photos/2228559/pexels-photo-2228559.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940','https://images.pexels.com/photos/261577/pexels-photo-261577.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940','https://images.pexels.com/photos/2113556/pexels-photo-2113556.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940','https://images.pexels.com/photos/3026801/pexels-photo-3026801.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940','https://images.pexels.com/photos/299350/pexels-photo-299350.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940','https://images.pexels.com/photos/3984735/pexels-photo-3984735.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940','https://images.pexels.com/photos/128403/pexels-photo-128403.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940','https://images.pexels.com/photos/5808/food-healthy-vegetables-village.jpg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940','https://images.pexels.com/photos/1084543/pexels-photo-1084543.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940','https://images.pexels.com/photos/2518893/pexels-photo-2518893.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940']
  end

  def blog_params
    blog_params = params.require(:blog).permit(:title, :content, :user_id)
  end

end
