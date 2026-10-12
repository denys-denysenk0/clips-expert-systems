(deftemplate person
   (multislot name)
   (slot age (type INTEGER))
   (slot gender (allowed-values male female)))

(deffacts people
   (person (name Name1 Surname1) (age 1) (gender male))
   (person (name Name1 Surname2) (age 2) (gender female))
   (person (name Name1 Surname3) (age 3) (gender male)))