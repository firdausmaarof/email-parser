class EmailProcessor
  def initialize(email)
    @email = email
  end

  def process
  	def extract_emails_to_array(txt)
	  reg = /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/i
	  txt.scan(reg).uniq
	end
	
	input = @email.body.split("\n")
	email_body = input.join(" ")
	result_array = extract_emails_to_array(email_body).sort
	result_array.each{
		|s|
		Email.create!({ email: s.to_s })
	}

    Post.create!({ body: @email.body, email: @email.from })
  end
end