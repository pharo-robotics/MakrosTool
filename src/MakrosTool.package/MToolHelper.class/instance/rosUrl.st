as yet unclassified
rosUrl
	^ rosUrl ifNil: [ self rosUrl: (OSProcess thisOSProcess environmentAt: 'ROS_MASTER_URI') ]