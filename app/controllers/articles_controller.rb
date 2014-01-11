class ArticlesController < ApplicationController
  def show
  end

  def index
    @articles, @tag = Article.search_by_tag_name(params[:tag])
    @pages = Page.all
  end

  def new
  end

  def create
    a = article
    a.attributes = params[:article]
    if a.save
      flash[:notice] = "Article was created."
      redirect_to articles_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if article.update_attributes(params[:article])
      flash[:notice] = "Article was updated."
      redirect_to article_path(article)
    else
      render :edit
    end
  end

  def destroy
    article.destroy
    flash[:notice] = "#{article} was destroyed."
    redirect_to articles_path
  end

  def article
    @cached_article ||= Article.find_or_initialize_by_id(params[:id])
  end

  helper_method :article

end
