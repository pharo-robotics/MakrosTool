service
start
	self application
		configure;
		start.
	system registerProcessToJoin: self application process