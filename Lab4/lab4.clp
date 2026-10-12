(deftemplate plant-symptom
   (slot name (type SYMBOL)))

(deftemplate deficiency-found
   (slot name (type SYMBOL)))

(deffunction ask-symptoms ()
   (printout t "Choose a symptom by number:" crlf)
   (printout t "1 - Stunted growth" crlf)
   (printout t "2 - Pale yellow in color" crlf)
   (printout t "3 - Reddish-brown leaf edges" crlf)
   (printout t "4 - Stunted root growth" crlf)
   (printout t "5 - Spindly stalk" crlf)
   (printout t "6 - Purplish in color" crlf)
   (printout t "7 - Delayed in maturing" crlf)
   (printout t "8 - Leaf edges that appear scorched" crlf)
   (printout t "9 - Weakened stems" crlf)
   (printout t "10 - Shriveled seeds or fruits" crlf)
   (printout t "0 - Start diagnostics" crlf)
   (printout t "-> ")
   
   (bind ?choice (read))
   
   (if (eq ?choice 0)
      then (printout t "Done" crlf)
           (run) 
      else
         (if (or (< ?choice 0) (> ?choice 10))
            then
               (printout t "Error: Invalid number. Enter number from 0 to 10" crlf)
               (ask-symptoms)
            else
               (if (eq ?choice 1)  then (assert (plant-symptom (name stunted-growth))))
               (if (eq ?choice 2)  then (assert (plant-symptom (name pale-yellow))))
               (if (eq ?choice 3)  then (assert (plant-symptom (name reddish-brown-edges))))
               (if (eq ?choice 4)  then (assert (plant-symptom (name stunted-root))))
               (if (eq ?choice 5)  then (assert (plant-symptom (name spindly-stalk))))
               (if (eq ?choice 6)  then (assert (plant-symptom (name purplish-color))))
               (if (eq ?choice 7)  then (assert (plant-symptom (name delayed-maturing))))
               (if (eq ?choice 8)  then (assert (plant-symptom (name leaf-scorched))))
               (if (eq ?choice 9)  then (assert (plant-symptom (name weakened-stems))))
               (if (eq ?choice 10) then (assert (plant-symptom (name shriveled-seeds))))
               (ask-symptoms)
         )
   )
)

(defrule start-program
   (declare (salience 100))
   =>
   (ask-symptoms))

(defrule check-nitrogen-stunted
   (plant-symptom (name stunted-growth))
   (not (deficiency-found (name nitrogen)))
   =>
   (printout t "The plant has a nitrogen deficiency." crlf)
   (assert (deficiency-found (name nitrogen))))

(defrule check-nitrogen-yellow
   (plant-symptom (name pale-yellow))
   (not (deficiency-found (name nitrogen)))
   =>
   (printout t "The plant has a nitrogen deficiency." crlf)
   (assert (deficiency-found (name nitrogen))))

(defrule check-nitrogen-edges
   (plant-symptom (name reddish-brown-edges))
   (not (deficiency-found (name nitrogen)))
   =>
   (printout t "The plant has a nitrogen deficiency." crlf)
   (assert (deficiency-found (name nitrogen))))

(defrule check-phosphorus-root
   (plant-symptom (name stunted-root))
   (not (deficiency-found (name phosphorus)))
   =>
   (printout t "The plant has a phosphorus deficiency." crlf)
   (assert (deficiency-found (name phosphorus))))

(defrule check-phosphorus-stalk
   (plant-symptom (name spindly-stalk))
   (not (deficiency-found (name phosphorus)))
   =>
   (printout t "The plant has a phosphorus deficiency." crlf)
   (assert (deficiency-found (name phosphorus))))

(defrule check-phosphorus-purple
   (plant-symptom (name purplish-color))
   (not (deficiency-found (name phosphorus)))
   =>
   (printout t "The plant has a phosphorus deficiency." crlf)
   (assert (deficiency-found (name phosphorus))))

(defrule check-phosphorus-mature
   (plant-symptom (name delayed-maturing))
   (not (deficiency-found (name phosphorus)))
   =>
   (printout t "The plant has a phosphorus deficiency." crlf)
   (assert (deficiency-found (name phosphorus))))

(defrule check-potassium-scorched
   (plant-symptom (name leaf-scorched))
   (not (deficiency-found (name potassium)))
   =>
   (printout t "The plant has a potassium deficiency." crlf)
   (assert (deficiency-found (name potassium))))

(defrule check-potassium-stems
   (plant-symptom (name weakened-stems))
   (not (deficiency-found (name potassium)))
   =>
   (printout t "The plant has a potassium deficiency." crlf)
   (assert (deficiency-found (name potassium))))

(defrule check-potassium-seeds
   (plant-symptom (name shriveled-seeds))
   (not (deficiency-found (name potassium)))
   =>
   (printout t "The plant has a potassium deficiency." crlf)
   (assert (deficiency-found (name potassium))))