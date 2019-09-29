require 'rails_helper'

describe 'イベント管理機能' type: :system do
    describe 'イベント一覧画面を表示する機能' do
        before do
          #test_user を作成しておく
          #作成者がtest_userであるイベントを作成しておく
        end
        
        contect 'test_userがログインしている時' do 
          before do 
              #test_userでログインする
          end
          
          it 'test_userが作成したイベントが表示される' do 
              #作成済みのタスクの名称が画面上に表示されていることを確認
          end
        end
    end
end