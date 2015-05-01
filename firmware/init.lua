pin1 = 1
pin2 = 5
current = 1
pwm.setup(1, 60, 88)
pwm.setup(5, 60, 88)
pwm.setduty(1, 92)
pwm.setduty(5, 92)
 
srv=net.createServer(net.TCP)
srv:listen(80,function(conn)
	conn:on("receive",function(conn,payload)
		for i in string.gmatch(payload, "%S+") do
			if i=="a" then
				current=pin1;
			elseif i=="b" then
				current=pin2;
			elseif i=="c" then
				pwm.stop(pin1)
				pwm.stop(pin2)
			else
				pwm.setduty(current, i)
			end
		end
		print(payload)
		conn:send("<h1> Hello, NodeMcu.</h1>")
	end)
	conn:on("sent",function(conn) conn:close() end)
end)