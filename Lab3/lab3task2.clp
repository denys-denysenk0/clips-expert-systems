(deftemplate plant-symptom
   (slot description (type STRING)))

(deftemplate deficiency-found
   (slot name (type SYMBOL)))

(deffacts test-input
   (plant-symptom (description "stunted root growth"))
   (plant-symptom (description "purplish in color")))

(defrule check-nitrogen-stunted
   (plant-symptom (description "stunted growth"))
   (not (deficiency-found (name nitrogen)))
   =>
   (printout t "The plant has a nitrogen deficiency." crlf)
   (assert (deficiency-found (name nitrogen))))

(defrule check-nitrogen-yellow
   (plant-symptom (description "pale yellow in color"))
   (not (deficiency-found (name nitrogen)))
   =>
   (printout t "The plant has a nitrogen deficiency." crlf)
   (assert (deficiency-found (name nitrogen))))

(defrule check-nitrogen-edges
   (plant-symptom (description "reddish-brown leaf edges"))
   (not (deficiency-found (name nitrogen)))
   =>
   (printout t "The plant has a nitrogen deficiency." crlf)
   (assert (deficiency-found (name nitrogen))))

(defrule check-phosphorus-root
   (plant-symptom (description "stunted root growth"))
   (not (deficiency-found (name phosphorus)))
   =>
   (printout t "The plant has a phosphorus deficiency." crlf)
   (assert (deficiency-found (name phosphorus))))

(defrule check-phosphorus-stalk
   (plant-symptom (description "spindly stalk"))
   (not (deficiency-found (name phosphorus)))
   =>
   (printout t "The plant has a phosphorus deficiency." crlf)
   (assert (deficiency-found (name phosphorus))))

(defrule check-phosphorus-purple
   (plant-symptom (description "purplish in color"))
   (not (deficiency-found (name phosphorus)))
   =>
   (printout t "The plant has a phosphorus deficiency." crlf)
   (assert (deficiency-found (name phosphorus))))

(defrule check-phosphorus-mature
   (plant-symptom (description "delayed in maturing"))
   (not (deficiency-found (name phosphorus)))
   =>
   (printout t "The plant has a phosphorus deficiency." crlf)
   (assert (deficiency-found (name phosphorus))))

(defrule check-potassium-scorched
   (plant-symptom (description "leaf edges that appear scorched"))
   (not (deficiency-found (name potassium)))
   =>
   (printout t "The plant has a potassium deficiency." crlf)
   (assert (deficiency-found (name potassium))))

(defrule check-potassium-stems
   (plant-symptom (description "weakened stems"))
   (not (deficiency-found (name potassium)))
   =>
   (printout t "The plant has a potassium deficiency." crlf)
   (assert (deficiency-found (name potassium))))

(defrule check-potassium-seeds
   (plant-symptom (description "shriveled seeds or fruits"))
   (not (deficiency-found (name potassium)))
   =>
   (printout t "The plant has a potassium deficiency." crlf)
   (assert (deficiency-found (name potassium))))
