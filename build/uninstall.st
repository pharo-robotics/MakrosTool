#!/usr/bin/env scale


system stdout << 'Uninstalling makros tool' << String cr.


makrosParentDirectory := system home / #bin / #makrosImage .

makrosParentDirectory exists ifTrue: [ system call: ' rm -r ', makrosParentDirectory fullName  ].

makrosX := system home / #bin / #makros 

makrosuiX := system home / #bin / #makros-ui. 

makrosX exists ifTrue: [ system call: ' rm ', makrosX fullName  ].
makrosuiX exists ifTrue: [ system call: ' rm ', makrosuiX fullName  ].

system stdout << 'Done!' << String cr.

