# require 'rest-client'

class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show update destroy ]

  
  # GET /articles
  def index
   begin
   # response = RestClient.get "https://pokeapi.co/api/v2/ability/?limit=&offset=20"
    response = RestClient.get("https://newsapi.org/v2/everything?q=apple",:Authorization=>"c4260b4e923b4e6dae9a63b55d30729b")
    if response.code == 200
        resultado = JSON.parse(response.to_str)
        render status:200, json:{ news: resultado,prueba:2}
    else
        render status:400, json:{ error: "Hay problemas para conectarse con el api externo"}
    end
  rescue
    render status:401, json:{ error: "No Hay autorizacion posiblemente requiere token"}
  end 
  
end
   
   

  # GET /articles/1
  def show
    render status:200, json:{ news: @article}
  end

  # POST /articles
  def create
    @article = Article.new(article_params)

    if @article.save
      render @article, status: :created, location: @article
    else
      render @article.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /articles/1
  def update
    if @article.update(article_params)
      render  @article
    else
      render  @article.errors, status: :unprocessable_entity
    end
  end

  # DELETE /articles/1
  def destroy
    @article.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:source, :author, :title, :description, :url, :urlToImage, :publishedAt, :content)
    end

    # def token
    #  if request.headers["Authorization"] == "c4260b4e923b4e6dae9a63b55d30729b"
       
    #  else
    #  end 
     # end
end
