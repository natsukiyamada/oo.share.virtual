FactoryBot.define do
    factory :event do
		name { 'test_event' }
        event_code { '4ac7bd' }
        content { 'これはテストの為のイベント説明文です' }
        user
	end
end