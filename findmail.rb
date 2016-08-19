def extract_emails_to_array(txt)
  reg = /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/i
  txt.scan(reg).uniq
end
input = IO.readlines("in.txt")
email_body = input.join(" ")
result_array = extract_emails_to_array(email_body).sort
puts result_array.size  #optional
result_array.each{
	|s|
	puts s.to_s
}