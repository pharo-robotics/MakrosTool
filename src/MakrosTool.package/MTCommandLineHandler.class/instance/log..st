as yet unclassified
log: aLogFilePath
	runner logFile: (aLogFilePath asFileReference openWritable: true).
	