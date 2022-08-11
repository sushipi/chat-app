class MessagesController < ApplicationController
  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
    @messages = @room.messages.includes(:user)

  end

  def create 
    # room_idから、特定のレコードを取得
    @room = Room.find(params[:room_id])
     # 特定のメッセージに紐づくインスタンスを生成し、属性値を指定
    @message = @room.messages.new(message_params)
    # インスタンスを保存
    if @message.save
      redirect_to room_messages_path(@room)
    else
      @messages = @room.messages.includes(:user)
      render :index
    end   
  end  

  private
  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id) 
    #messageの内容(content)をテーブルへ保存できるようにする。  
    #ログインしているユーザーIDと紐づいているメッセージ内容を受け取るように許可している
  end
end
