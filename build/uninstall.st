#!/usr/bin/scale


system stdout << 'Uninstalling makros tool' << String cr.


makrosParentDirectory := '/usr/bin/makrosImage' asFileReference.
makrosParentDirectory exists ifTrue: [ system call: ' rm -r ', makrosParentDirectory fullName  ].

makrosX := '/usr/bin/makros' asFileReference. 

makrosuiX := '/usr/bin/makros-ui' asFileReference. 

makrosX exists ifTrue: [ system call: ' rm ', makrosX fullName  ].
makrosuiX exists ifTrue: [ system call: ' rm ', makrosuiX fullName  ].

system stdout << 'Done!' << String cr.

