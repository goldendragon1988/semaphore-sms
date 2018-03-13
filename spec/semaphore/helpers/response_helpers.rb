module ResponseHelpers
	#GET REQUEST
	def account_response
		"{\"account_id\":4688,\"account_name\":\"FreeLance\",\"status\":\"Active\",\"credit_balance\":\"504\"}"
	end

	def messages_response
		"[{\"message_id\":55839067,\"user_id\":4788,\"user\":\"jag.arnold.go@gmail.com\",\"account_id\":4688,\"account\":\"FreeLance\",\"recipient\":\"639175488888\",\"message\":\"This is my first message using semaphore\",\"sender_name\":\"Semaphore\",\"network\":\"Globe\",\"status\":\"Sent\",\"type\":\"Single\",\"source\":\"Api\",\"created_at\":\"2018-03-10 20:33:02\",\"updated_at\":\"2018-03-10 20:33:05\"},{\"message_id\":55839520,\"user_id\":4788,\"user\":\"jag.arnold.go@gmail.com\",\"account_id\":4688,\"account\":\"FreeLance\",\"recipient\":\"639175488888\",\"message\":\"I love you so much\",\"sender_name\":\"Semaphore\",\"network\":\"Globe\",\"status\":\"Sent\",\"type\":\"Bulk\",\"source\":\"Api\",\"created_at\":\"2018-03-10 21:04:55\",\"updated_at\":\"2018-03-10 21:04:59\"},{\"message_id\":55839521,\"user_id\":4788,\"user\":\"jag.arnold.go@gmail.com\",\"account_id\":4688,\"account\":\"FreeLance\",\"recipient\":\"639778048888\",\"message\":\"I love you so much\",\"sender_name\":\"Semaphore\",\"network\":\"Next\",\"status\":\"Sent\",\"type\":\"Bulk\",\"source\":\"Api\",\"created_at\":\"2018-03-10 21:04:55\",\"updated_at\":\"2018-03-10 21:04:59\"},{\"message_id\":55843872,\"user_id\":4788,\"user\":\"jag.arnold.go@gmail.com\",\"account_id\":4688,\"account\":\"FreeLance\",\"recipient\":\"639778048888\",\"message\":\"I love you\",\"sender_name\":\"Semaphore\",\"network\":\"Next\",\"status\":\"Sent\",\"type\":\"Single\",\"source\":\"Api\",\"created_at\":\"2018-03-11 08:04:31\",\"updated_at\":\"2018-03-11 08:04:36\"},{\"message_id\":55870890,\"user_id\":4788,\"user\":\"jag.arnold.go@gmail.com\",\"account_id\":4688,\"account\":\"FreeLance\",\"recipient\":\"639175488888\",\"message\":\"Hello world\",\"sender_name\":\"Semaphore\",\"network\":\"Globe\",\"status\":\"Sent\",\"type\":\"Bulk\",\"source\":\"Api\",\"created_at\":\"2018-03-12 19:06:25\",\"updated_at\":\"2018-03-12 19:06:29\"},{\"message_id\":55870891,\"user_id\":4788,\"user\":\"jag.arnold.go@gmail.com\",\"account_id\":4688,\"account\":\"FreeLance\",\"recipient\":\"639778048888\",\"message\":\"Hello world\",\"sender_name\":\"Semaphore\",\"network\":\"Next\",\"status\":\"Sent\",\"type\":\"Bulk\",\"source\":\"Api\",\"created_at\":\"2018-03-12 19:06:25\",\"updated_at\":\"2018-03-12 19:06:32\"}]"
	end

	def message_response
		"[{\"message_id\":55870891,\"user_id\":4788,\"user\":\"jag.arnold.go@gmail.com\",\"account_id\":4688,\"account\":\"FreeLance\",\"recipient\":\"639778048888\",\"message\":\"Hello world\",\"sender_name\":\"Semaphore\",\"network\":\"Next\",\"status\":\"Sent\",\"type\":\"Bulk\",\"source\":\"Api\",\"created_at\":\"2018-03-12 19:06:25\",\"updated_at\":\"2018-03-12 19:06:32\"}]"
	end

	def transactions_response
		"[{\"id\":10938708,\"user_id\":4788,\"user\":\"jag.arnold.go@gmail.com\",\"status\":\"Approved\",\"transaction_method\":\"Cash\",\"external_transaction_id\":\"\",\"amount\":\"250.00\",\"credit_value\":\"500\",\"created_at\":\"2018-03-09 4:07 pm\",\"updated_at\":\"2018-03-12 9:57 am\"},{\"id\":10944298,\"user_id\":1,\"user\":\"admin@kickstart.ph\",\"status\":\"Approved\",\"transaction_method\":\"Promotion\",\"external_transaction_id\":\"Bonus Credits For Approved Account\",\"amount\":\"0.00\",\"credit_value\":\"10\",\"created_at\":\"2018-03-09 10:00 pm\",\"updated_at\":\"2018-03-09 10:00 pm\"},{\"id\":10957188,\"user_id\":4788,\"user\":\"jag.arnold.go@gmail.com\",\"status\":\"Approved\",\"transaction_method\":\"Message\",\"external_transaction_id\":\"55839067\",\"amount\":\"0.00\",\"credit_value\":\"-1\",\"created_at\":\"2018-03-10 8:33 pm\",\"updated_at\":\"2018-03-10 8:33 pm\"},{\"id\":10957641,\"user_id\":4788,\"user\":\"jag.arnold.go@gmail.com\",\"status\":\"Approved\",\"transaction_method\":\"Message\",\"external_transaction_id\":\"55839520\",\"amount\":\"0.00\",\"credit_value\":\"-1\",\"created_at\":\"2018-03-10 9:04 pm\",\"updated_at\":\"2018-03-10 9:04 pm\"},{\"id\":10957642,\"user_id\":4788,\"user\":\"jag.arnold.go@gmail.com\",\"status\":\"Approved\",\"transaction_method\":\"Message\",\"external_transaction_id\":\"55839521\",\"amount\":\"0.00\",\"credit_value\":\"-1\",\"created_at\":\"2018-03-10 9:04 pm\",\"updated_at\":\"2018-03-10 9:04 pm\"},{\"id\":10961995,\"user_id\":4788,\"user\":\"jag.arnold.go@gmail.com\",\"status\":\"Approved\",\"transaction_method\":\"Message\",\"external_transaction_id\":\"55843872\",\"amount\":\"0.00\",\"credit_value\":\"-1\",\"created_at\":\"2018-03-11 8:04 am\",\"updated_at\":\"2018-03-11 8:04 am\"},{\"id\":10989051,\"user_id\":4788,\"user\":\"jag.arnold.go@gmail.com\",\"status\":\"Approved\",\"transaction_method\":\"Message\",\"external_transaction_id\":\"55870890\",\"amount\":\"0.00\",\"credit_value\":\"-1\",\"created_at\":\"2018-03-12 7:06 pm\",\"updated_at\":\"2018-03-12 7:06 pm\"},{\"id\":10989052,\"user_id\":4788,\"user\":\"jag.arnold.go@gmail.com\",\"status\":\"Approved\",\"transaction_method\":\"Message\",\"external_transaction_id\":\"55870891\",\"amount\":\"0.00\",\"credit_value\":\"-1\",\"created_at\":\"2018-03-12 7:06 pm\",\"updated_at\":\"2018-03-12 7:06 pm\"}]"
	end

	def sendernames_response
		"[{\"name\":\"JNR\",\"status\":\"Pending\",\"created\":\"2018-03-12 2:13 pm\"}]"
	end

	def users_response
		"[{\"user_id\":4788,\"email\":\"jag.arnold.go@gmail.com\",\"role\":\"Owner\"}]"
	end

	#POST REQUEST
	def send_response
		"[{\"message_id\":55871500,\"user_id\":4788,\"user\":\"jag.arnold.go@gmail.com\",\"account_id\":4688,\"account\":\"FreeLance\",\"recipient\":\"639778048888\",\"message\":\"I love you so much\",\"sender_name\":\"Semaphore\",\"network\":\"Next\",\"status\":\"Pending\",\"type\":\"Single\",\"source\":\"Api\",\"created_at\":\"2018-03-12 20:11:21\",\"updated_at\":\"2018-03-12 20:11:21\"}]"
	end

	def bulk_send_response
		"[{\"message_id\":55871554,\"user_id\":4788,\"user\":\"jag.arnold.go@gmail.com\",\"account_id\":4688,\"account\":\"FreeLance\",\"recipient\":\"639175488888\",\"message\":\"Hello World\",\"sender_name\":\"Semaphore\",\"network\":\"Globe\",\"status\":\"Pending\",\"type\":\"Bulk\",\"source\":\"Api\",\"created_at\":\"2018-03-12 20:16:46\",\"updated_at\":\"2018-03-12 20:16:46\"},{\"message_id\":55871555,\"user_id\":4788,\"user\":\"jag.arnold.go@gmail.com\",\"account_id\":4688,\"account\":\"FreeLance\",\"recipient\":\"639778048888\",\"message\":\"Hello World\",\"sender_name\":\"Semaphore\",\"network\":\"Next\",\"status\":\"Pending\",\"type\":\"Bulk\",\"source\":\"Api\",\"created_at\":\"2018-03-12 20:16:46\",\"updated_at\":\"2018-03-12 20:16:46\"}]"
	end

	def priority_response
		"[{\"message_id\":55871579,\"user_id\":4788,\"user\":\"jag.arnold.go@gmail.com\",\"account_id\":4688,\"account\":\"FreeLance\",\"recipient\":\"639778048888\",\"message\":\"I love you so much\",\"sender_name\":\"Semaphore\",\"network\":\"Next\",\"status\":\"Pending\",\"type\":\"Priority\",\"source\":\"Api\",\"created_at\":\"2018-03-12 20:20:05\",\"updated_at\":\"2018-03-12 20:20:05\"}]"
	end

	def bulk_priority_response
		"[{\"message_id\":55871602,\"user_id\":4788,\"user\":\"jag.arnold.go@gmail.com\",\"account_id\":4688,\"account\":\"FreeLance\",\"recipient\":\"639778048888\",\"message\":\"I love you so much\",\"sender_name\":\"Semaphore\",\"network\":\"Next\",\"status\":\"Pending\",\"type\":\"Priority\",\"source\":\"Api\",\"created_at\":\"2018-03-12 20:23:09\",\"updated_at\":\"2018-03-12 20:23:09\"},{\"message_id\":55871603,\"user_id\":4788,\"user\":\"jag.arnold.go@gmail.com\",\"account_id\":4688,\"account\":\"FreeLance\",\"recipient\":\"639175488888\",\"message\":\"I love you so much\",\"sender_name\":\"Semaphore\",\"network\":\"Globe\",\"status\":\"Pending\",\"type\":\"Priority\",\"source\":\"Api\",\"created_at\":\"2018-03-12 20:23:09\",\"updated_at\":\"2018-03-12 20:23:09\"}]"
	end
end
