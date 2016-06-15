#!/usr/bin/scale

FileStream stdout << 'Installing Makros framework'; cr.

Gofer it
	smalltalkhubUser: 'sbragagnolo' project: 'Makros';
	configurationOf: 'Makros';
	loadVersion: #bleedingEdge.

FileStream stdout << 'Installing Makros'; cr.

Gofer it
	repository: (MCFileTreeRepository new 
					directory: system pwd / 'src';
					yourself);
	package: 'MakrosTool';
	load.

(system pwd / 'cache' ) ensureCreateDirectory.


system stdout << ' Building Makros image at'  << (system pwd / 'cache'/ 'Pharo') fullName << String cr.

Smalltalk saveAs: system pwd /'cache'/ 'Pharo'.


Smalltalk snapshot: true andQuit: true.


