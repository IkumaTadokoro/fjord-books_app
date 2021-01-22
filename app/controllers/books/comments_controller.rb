# frozen_string_literal: true

class Books::CommentsController < ApplicationController
  before_action :set_book

  def create
    comment = @book.comments.new(comment_params)
    comment.user = current_user

    if comment.save
      redirect_to @book, notice: t('controllers.common.notice_create', name: Comment.model_name.human)
    else
      render :new
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to @book, notice: t('controllers.common.notice_destroy', name: Comment.model_name.human)
  end

  private

  def set_book
    @book = Book.find(params[:book_id])
  end

  def comment_params
    params.require(:comment).permit(:contents)
  end
end
