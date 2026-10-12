(defrule find-today-day
   (Today is ?day)
   =>
   (printout t "Today is " ?day crlf))