#!/usr/bin/scale

Smalltalk saveAs: (system pwd /'cache'/ 'Pharo') fullName.

Metacello new
  baseline: 'MakrosTool';
  repository: 'filetree://', (system pwd / 'src') fullName;
  onConflict: [:ex | ex allow];
  load.

(system pwd / 'cache' ) ensureCreateDirectory.

system stdout << ' Building Makros image at'  << (system pwd / 'cache'/ 'Pharo') fullName << String cr.


Smalltalk saveAs: (system pwd /'cache'/ 'Pharo') fullName.


