class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :set_event, only: [:create, :edit, :update]

  def index
    @comments = Comment.all
  end

  def show
  end

  def edit
  end

  def create
    @event_comment = Comment.new(comment_params)
    @event = Event.find(comment_params[:event_id])
    if @event_comment.save
      respond_to do |format|
        format.html { redirect_back(fallback_location: @event) }
        format.js { }
      end
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to event_path(@event), notice: 'Comment was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if @comment.destroy
      respond_to do |format|
        format.html { redirect_back(fallback_location: @event) }
        format.js { }
      end
    end
  end

  private

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def set_event
      @event = Event.find(comment_params[:event_id])
    end

    def comment_params
      params.require(:comment).permit(:text, :user_id, :event_id)
    end
end
