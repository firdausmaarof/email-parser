class EmailProcessor
  def initialize(email)
    @email = email
  end

  def process
    Post.create!({ body: @email.body, email: @email.from })

    def extract_emails_to_array(txt)
	  reg = /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/i
	  txt.scan(reg).uniq
	end
	
	input = @email.body
	result_array = extract_emails_to_array(input.join(" ")).sort
	result_array.each{
		|s|
		Email.create!({ email: s.to_s })
	}
  end
end