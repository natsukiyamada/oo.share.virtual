module ApplicationHelper

	def random_code
	    @rand = SecureRandom.hex(3)
	    return @rand
	end

   def judge_unknown_user_id
     if current_user && session[:unknown_user_id].present?
         return true
     end
   end
end
