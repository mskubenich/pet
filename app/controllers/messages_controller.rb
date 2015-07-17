class MessagesController < ApplicationController
  def index
    # users_arel = User.arel_table
    # messages_arel = Message.arel_table
    #
    # query = messages_arel
    #             .project(Arel.star)
    #             .where(messages_arel[:user_id].eq(current_user.id).or(messages_arel[:author_id].eq(current_user.id)))
    #             .order('created_at DESC')
    #             .group("user_id, author_id")

    @conversations = Message.find_by_sql(
      <<SQL
        select users.id AS friend_id , messages.*
        from users
        inner join (
        select * from messages ORDER BY created_at DESC
        )messages
        on (messages.author_id = #{ current_user.id } AND messages.user_id = users.id) OR (messages.author_id = users.id AND messages.user_id = #{ current_user.id })
        GROUP BY friend_id
SQL
    )
  end

  def create
    @message = Message.new message_params
    @message.author_id = current_user.id if current_user
    if @message.save
      render json: {ok: true}
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:id])
    @messages = Message.where("(messages.author_id = #{ current_user.id } AND messages.user_id = #{ @user.id  }) OR (messages.author_id = #{ @user.id } AND messages.user_id = #{ current_user.id })")
  end

  private

  def message_params
    params.require(:message).permit(:user_id, :text)
  end

end