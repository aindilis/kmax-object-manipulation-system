(Typing
 (File Typing
  (libextract, file)
  (file classification, file typing)
  (related files
   (/var/lib/myfrdcsa/codebases/internal/kbfs/scripts/categorize-files.pl)
   (/var/lib/myfrdcsa/codebases/internal/kbfs/scripts/kbfsa)
   (/var/lib/myfrdcsa/codebases/internal/kbfs/scripts/kbfs-analyzer)
   (/var/lib/myfrdcsa/codebases/internal/kbfs/scripts/kbfs-tracker)
   )

  )
 (String Typing
  (related files
   (/var/lib/myfrdcsa/codebases/minor/iaec/frdcsa/sys/flp/autoload/typing.pl)
   (... (many more))
   )
  )
 )

(so for instance)

(grab object
 (resolves to different objects that are evident in the situation
  (including objects under text point
   (character under point)
   (programming
    (sexp)
    
    )
   (document formatting
    (sentence)
    (paragraph)
    
    )
   )
  (current buffer 
   (visiting file)
   (visiting urls)
   )
  (object on top of stack)
  (object on top of ring)
  )
 )

(Think about EIEIO in relation to KMax Object System)

(Maybe we can associate types and EIEIO classes with textual and
 lisp other objects.  Can't really prove things in ACL2 about
 them, unless we use applicative type guards.)

(?use eieio-persistent to store EIEIO objects?)

(we can use Cyc ontology maybe, or other ontologies)

(what about Flora2 - flora2 can process some of the type
 definitions from EIEIO, CLOS etc - remember Jess' idea of clean
 data)

