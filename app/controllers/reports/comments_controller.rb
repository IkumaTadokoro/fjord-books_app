# frozen_string_literal: true

class Reports::CommentsController < ApplicationController
  before_action :set_report

  def create
    comment = @report.comments.new(comment_params)
    comment.user = current_user

    if comment.save
      redirect_to @report, notice: t('controllers.common.notice_create', name: Comment.model_name.human)
    else
      render :new
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to @report, notice: t('controllers.common.notice_destroy', name: Comment.model_name.human)
  end

  private

  def set_report
    @report = Report.find(params[:report_id])
  end

  def comment_params
    params.require(:comment).permit(:contents)
  end
end
