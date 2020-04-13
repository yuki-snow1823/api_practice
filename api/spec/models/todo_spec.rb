require 'rails_helper'

RSpec.describe Todo, type: :model do
  describe '動作確認のテスト' do
    before do
      @user = FactoryBot.create(:user)
    end

    it 'Todoを追加' do
      user = @user
      todo = Todo.new(
        user_id: 1,
        title: "test",
        point: 1,
      )
      expect(todo).to be_valid
    end

    it 'Todoを削除' do
      user = @user
      todo =FactoryBot.create(:todo)
      todo.destroy
      expect{Todo.find(1)}.to raise_exception(ActiveRecord::RecordNotFound)
    end

    it 'Todoのtitleを編集' do
      user = @user
      todo =FactoryBot.create(:todo)
      todo.update(title: "new-title")
      expect(todo.title).to eq "new-title"
    end

    it 'Todoのpointを編集' do
      user = @user
      todo =FactoryBot.create(:todo)
      todo.update(point: 2)
      expect(todo.point).to eq 2
    end
  
  end

  describe 'バリデーションのテスト' do
    before do
      @user = FactoryBot.create(:user)
    end

    it 'Todoはtitleが空の場合保存されない' do
      user = @user
      todo = Todo.new(
        user_id: 1,
        title: "",
        point: 1,
      )
      todo.valid?
      expect(todo.errors[:title]).to include("can't be blank")
    end

    # it 'Todoを削除' do
    #   user = @user
    #   todo =FactoryBot.create(:todo)
    #   todo.destroy
    #   expect{Todo.find(1)}.to raise_exception(ActiveRecord::RecordNotFound)
    # end

  
  end
end