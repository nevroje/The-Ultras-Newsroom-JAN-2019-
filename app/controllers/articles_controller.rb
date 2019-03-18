class ArticlesController < ApplicationController
    protect_from_forgery
    before_action :check_user, only: [:create, :new]
    before_action :authenticate_user!, only: [:create, :new]
    def index
        @articles = Article.all.where(approved: true)
    end

    def new
        @articles = Article.all
    end

    def show
        @article = Article.find(params[:id])
    end

    def create
        article = Article.new(article_params)
       
        if article.save
            redirect_to new_article_path, notice: 'Article was successfully created.'
        else
            redirect_to new_article_path, alert: 'You have to fill out all the fields'
        end
    end

    def edit
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])
       
        if @article.update(article_params)
          redirect_to @article
        else
          render 'edit'
        end
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
       
        redirect_to new_article_path
    end

    def publish
        @article = Article.find(params[:id])
        @article = Article.where(is_active: true)
    end

    def take_down
        @article = Article.find(params[:id])
        @article = Article.where(is_active: false)
    end
       
    private

    def check_user
        if user_signed_in? && current_user.journalist? || current_user.editor?
            true
        else
            redirect_to root_path, notice: 'Permission denied.'
        end
    end

    def article_params
        params.require(:article).permit(:title, :content, :lead)
    end     
end
