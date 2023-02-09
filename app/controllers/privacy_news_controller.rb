
class PrivacyNewsController < ApplicationController
  #you can add any article to you favourite list that is going to be saved on the database
  #everytime you visit the page, the articles are going to be updated but you favourite list is going to be saved

  def index
    require 'httparty'
    @api_key = "d85b8cfd60f54646b18b1e52a1e70862"
    @five_days_ago = (Date.today - 5).strftime("%Y-%m-%d")
    @url = "https://newsapi.org/v2/everything?q=privacy+laws&from=" + @five_days_ago + "&sortBy=popularity&apiKey=" + @api_key
    @response = HTTParty.get(@url)

    @articles = @response["articles"]
    @fav_articles = Article.all

    @titles = []
    @descriptions = []
    @urls = []
    @articles.each do |article|
      @titles << article["title"]
      @descriptions << article["description"]
      @urls << article["url"]
    end
  end
  # bin/rails generate model Article title:string description:text url:string
  # bin/rails db:migrate
  def create
    #save the article to the database
    @saved_article = Article.new(title: params[:title], description: params[:description], url: params[:url])
    puts @saved_article.save
    puts @saved_article.errors.full_messages
    if @saved_article.save   
      puts "Article saved"
      redirect_to root_path   
    else   
      puts "Article not saved"
      redirect_to root_path   
    end
  end

  #delete the article from the database
  def destroy
    puts "destroying"
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to root_path
  end



end
