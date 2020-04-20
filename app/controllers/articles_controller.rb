class ArticlesController < ApplicationController
    #define an action inside a controller
    def index
        @articles = Article.all
    end
    def show
        @article = Article.find(params[:id])
    end
    def new
        @article = Article.new
    end

    # when a form is submitted, the field of the form are sent to rails as parameters.
    # these parameters can then be referenced inside the controller actions, typically to perform 
    # a particular task. to see what these parameters look like, change the create
    # action to this:
  

    def create
        @article = Article.new(article_params)

        if @article.save
        redirect_to @article
        else
            render 'new'
        end
    end

    
    private
    def article_params
        params.require(:article).permit(:title, :text)
    end


    

end
