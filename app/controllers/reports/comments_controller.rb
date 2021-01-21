# frozen_string_literal: true

class Reports::CommentsController < ApplicationController
  def create
    report = Report.find(params[:report_id])
    comment = report.comments.new(comment_params)
    comment.user = current_user

    if comment.save
      redirect_to report, notice: t('controllers.common.notice_create', name: Comment.model_name.human)
    else
      render :new
    end
  end

  def comment_params
    params.require(:comment).permit(:contents)
  end
end
