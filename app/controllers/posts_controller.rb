class PostsController < ApplicationController
    def index
        @posts = Post.all
    end

    def show
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to @post, notice: "投稿が作成されました。"
        else
            render :new
        end
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.new(post_params)
        if @post.update(post_params)
            redirect_to @post, notice: "投稿が更新されました。"
        else
            render :edit
        end
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to posts_path, notice: "投稿が削除されました。"
    end

    private

    def post_params
        params.require(:post).permit(:title, :content, :image)  # Strong Parametersで安全な属性のみ許可
    end
end
