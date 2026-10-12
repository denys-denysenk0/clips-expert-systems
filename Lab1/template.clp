(deftemplate person
   (slot name)
   (slot age)
   (slot gender))

(deffacts people
   (person (name "Name1") (age 1) (gender male))
   (person (name "Name2") (age 2) (gender female))
   (person (name "Name3") (age 3) (gender male)))