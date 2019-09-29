FactoryBot.difine do
	factory :user do
		name { 'test_user' }
        mail { 'test1@example.com' }
        password { 'password' }
	end
end