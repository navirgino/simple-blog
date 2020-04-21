class CommentsController < ApplicationController
    def create
        # find article by id
        @article = Article.find(params[:article_id])
        # once found, instantiate a comment, and create using comment params
        @comment = @article.comments.create(comment_params)
        # once create redir to single article view
        redirect_to article_path(@article)
    end

    def destroy
        @article = Article.find(params[:article_id])
        @comment = Comment.find(params[:id])
        @comment.destroy

        redirect_to article_path(@article)
    end
    # or like this: 
    #def destroy
    #@article = Article.find(params[:article_id])
    #@comment = @article.comments.find(params[:id])
    #@comment.destroy
    #redirect_to article_path(@article)
  #end

    private
        def comment_params
            params.require(:comment).permit(:commenter, :body)
        end
end
