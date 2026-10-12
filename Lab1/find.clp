(deftemplate person
   (multislot name)
   (slot age (type INTEGER))
   (slot gender (allowed-values male female)))

(deffacts people
   (person (name Name1 Surname1) (age 1) (gender male))
   (person (name Name1 Surname2) (age 2) (gender female))
   (person (name Name1 Surname3) (age 3) (gender male)))
   
(defrule find-name1-1
   (person (name Name1 Surname1) (age 1))
   =>
   (printout t "Finded Name1 Surname1 with age of 1" crlf))