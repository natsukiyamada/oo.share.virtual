module ApplicationHelper

def random_code
    @rand = SecureRandom.hex(3)
    return @rand
end

end
