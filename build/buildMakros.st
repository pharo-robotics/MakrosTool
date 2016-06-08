#!/usr/bin/scale/scale

FileStream stdout << 'Installing Makros framework'; cr.

Gofer it
	smalltalkhubUser: 'sbragagnolo' project: 'Makros';
	configurationOf: 'Makros';
	loadVersion: #bleedingEdge.

"FileStream stdout << 'Installing Makros'; cr.
Gofer it
	repository: (MCFileTreeRepository new 
					directory: FileSystem workingDirectory / '..'/ 'src';
					yourself);
	package: 'MakrosTool';
	load."

FileStream stdout << 'Snapshotting'; cr.
(system pwd / 'cache' )ensureCreateDirectory.


system stdout << ' Building Makros image at'  << (system pwd / 'cache'/ 'Pharo') fullName << String cr.
Smalltalk saveAs: system pwd /'cache'/ 'Pharo'.


Smalltalk snapshot: true andQuit: true.


