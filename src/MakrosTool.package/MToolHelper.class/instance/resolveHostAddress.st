private
resolveHostAddress
	" First try to load the ROS_IP globar variable. If its not set up, use the ROS_HOSTNAME global variable. If it's not setup either of both previous variables, then ask for the Host address   "

	^ ((OSProcess thisOSProcess environmentAt: 'ROS_IP') ifNil: [ NetNameResolver addressForName: (OSProcess thisOSProcess environmentAt: 'ROS_HOSTNAME') ]) ifNil: [ NetNameResolver localHostAddress ]