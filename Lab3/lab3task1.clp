(deftemplate person-gender
   (slot name (type SYMBOL))
   (slot gender (type SYMBOL) (allowed-symbols male female)))

(deftemplate family-role
   (slot name (type SYMBOL))
   (slot role (type SYMBOL) (allowed-symbols father mother son)))

(deftemplate parent-child
   (slot child (type SYMBOL))
   (slot father (type SYMBOL))
   (slot mother (type SYMBOL)))

(deffacts family-facts "John Family"
   (person-gender (name Tom) (gender male))
   (person-gender (name Susan) (gender female))
   (person-gender (name John) (gender male))
   (family-role (name Tom) (role father))
   (family-role (name Susan) (role mother))
   (family-role (name John) (role son))
   (parent-child (child John) (father Tom) (mother Susan)))

(defrule print-1
   (declare (salience 90))
   (parent-child (child ?c) (father ?f))
   =>
   (printout t "The father of " ?c " is " ?f "." crlf))

(defrule print-2
   (declare (salience 80))
   (parent-child (child ?c) (mother ?m))
   =>
   (printout t "The mother of " ?c " is " ?m "." crlf))

(defrule print-3
   (declare (salience 70))
   (parent-child (child ?c) (father ?f) (mother ?m))
   =>
   (printout t "The parents of " ?c " are " ?f " and " ?m "." crlf))

(defrule print-4
   (declare (salience 60))
   (family-role (name ?n&Tom) (role ?r))
   =>
   (printout t ?n " is a " ?r "." crlf))

(defrule print-5
   (declare (salience 50))
   (family-role (name ?n&Susan) (role ?r))
   =>
   (printout t ?n " is a " ?r "." crlf))

(defrule print-6
   (declare (salience 40))
   (family-role (name ?n&John) (role ?r))
   =>
   (printout t ?n " is a " ?r "." crlf))

(defrule print-7
   (declare (salience 30))
   (person-gender (name ?n&Tom) (gender ?g))
   =>
   (printout t ?n " is a " ?g "." crlf))

(defrule print-8
   (declare (salience 20))
   (person-gender (name ?n&Susan) (gender ?g))
   =>
   (printout t ?n " is a " ?g "." crlf))

(defrule print-9
   (declare (salience 10))
   (person-gender (name ?n&John) (gender ?g))
   =>
   (printout t ?n " is a " ?g "." crlf))