#!/usr/bin/scale

" DEPLOY "
system stdout << 'Deploying makros command';cr.

makrosParentDirectory := '/usr/bin/makrosImage' asFileReference.

makrosParentDirectory exists 
ifTrue: [ 
	system stderr << 'There is already an installation. Please uninstall before' 
] ifFalse: [
	makrosParentDirectory ensureCreateDirectory.
	makrosFile := makrosParentDirectory / '..' / 'makros'.
	makrosUIFile := makrosParentDirectory / '..' /'makros-ui'.
	system pwd / 'makros'  copyTo: makrosFile.
	system pwd  / 'makros-ui'  copyTo: makrosUIFile.
	system stdout << 'Deploying Makros';cr.

	#('Pharo.image' 'Pharo.changes')
		do: [ :file | system pwd / 'cache' / file  copyAllTo: makrosParentDirectory / file ].

	system stdout << 'Giving permissions to run';cr.

	
	system call: 'chmod +x ', makrosFile fullName.
	system call: 'chmod +x ', makrosUIFile fullName.
	system call: 'chmod a-w ' , (makrosParentDirectory / 'Pharo.changes') fullName.
	system stdout << 'Done!'.

].


