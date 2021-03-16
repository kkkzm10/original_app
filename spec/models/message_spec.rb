require 'rails_helper'

RSpec.describe Message, type: :model do
  describe '#create' do
    before do
      @message = FactoryBot.build(:message)
    end

    it 'messageが存在していれば保存できること' do
      expect(@message).to be_valid
    end

    it 'messageが空では保存できないこと' do
      @message.message = ''
      @message.valid?
      expect(@message.errors.full_messages).to include("Message can't be blank")
    end

    it 'roomが紐付いていないと保存できないこと' do
      @message.room = nil
      @message.valid?
      expect(@message.errors.full_messages).to include('Room must exist')
    end

    it 'userが紐付いていないと保存できないこと' do
      @message.user = nil
      @message.valid?
      expect(@message.errors.full_messages).to include('User must exist')
    end
  end 
end
