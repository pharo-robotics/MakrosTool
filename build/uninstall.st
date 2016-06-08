#!/usr/bin/scale/scale


system stdout << 'Uninstalling makros tool' << String cr.


makrosParentDirectory := '/usr/bin/makros' asFileReference.
makrosParentDirectory exists ifTrue: [ system call: ' rm -r ', makrosParentDirectory fullName  ].


system stdout << 'Done!' << String cr.

