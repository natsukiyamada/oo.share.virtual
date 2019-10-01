require 'rails_helper'

describe 'イベント管理機能', type: :system do
  describe 'イベント一覧画面を表示する機能' do
      let(:test_user_a) {FactoryBot.create(:user, name: 'test_user_a', mail: 'a@example.com')}
      let(:test_user_b) { FactoryBot.create(:user, name: 'test_user_b', mail: 'b@example.com', password: '123456')}
      
      before do
        FactoryBot.create(:event, name: '最初のイベント', user: test_user_a)
        visit root_path
        find(class: 'log_in').click
        sleep 0.5
        fill_in 'login_mail_field', with: login_user.mail
        fill_in 'login_password_field', with: login_user.password
        click_button 'login_btn'
      end
      
      context 'test_user_aがログインしている時' do 
        let(:login_user) { test_user_a }
        
        it 'test_user_aが作成したイベントが表示される' do 
            expect(page).to have_content '最初のイベント'
        end
      end
      
      context 'test_user_bがログインしている時' do
        let(:login_user) { test_user_b }
        
        it 'test_user_aが作成したイベントは表示されない' do
          expect(page).to have_no_content '最初のイベント'
        end
      end
  end
end

describe 'アンノウンユーザのイベント参加' do 

end
