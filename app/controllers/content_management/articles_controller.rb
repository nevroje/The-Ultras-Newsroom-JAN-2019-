class ContentManagement::ArticlesController < ApplicationController
    def edit
        @article = Article.find(params[:id])
    end

    def show
        
        binding.pry
        
        @article = Article.find(params[:id])
    end

    def index
        @article = Article.all
    end
end