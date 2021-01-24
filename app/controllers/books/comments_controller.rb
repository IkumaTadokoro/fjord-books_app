# frozen_string_literal: true

class Books::CommentsController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    comment = book.comments.new(comment_params)
    comment.user = current_user

    if comment.save
      redirect_to book, notice: t('controllers.common.notice_create', name: Comment.model_name.human)
    else
      render :new
    end
  end

  def comment_params
    params.require(:comment).permit(:contents)
  end
end
