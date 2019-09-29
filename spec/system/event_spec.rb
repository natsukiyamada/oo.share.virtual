require 'rails_helper'

describe 'イベント管理機能', type: :system do
    describe 'イベント一覧画面を表示する機能' do
        before do
          #test_user_a を作成しておく
          test_user_a = FactoryBot.create(:user, name: 'test_user_a', mail: 'a@example.com')
          #作成者がtest_user_aであるイベントを作成しておく
          FactoryBot.create(:event, name: '最初のイベント', user: test_user_a)
        end
        
        context 'test_user_aがログインしている時' do 
          before do 
              #test_user_aでログインする
              visit root_path
              find(class: 'log_in').click
              sleep 0.5
              fill_in 'login_mail_field', with: 'a@example.com'
              fill_in 'login_password_field', with: 'password'
              click_button 'login_btn'
          end
          
          it 'test_user_aが作成したイベントが表示される' do 
              #作成済みのタスクの名称が画面上に表示されていることを確認
              expect(page).to have_content '最初のイベント'
          end
        end
    end
end