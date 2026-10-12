(deftemplate set-info
   (slot name (type SYMBOL))
   (multislot elements)
   (slot is-subset-of (type SYMBOL) (default none)))

(deffacts sets-facts "ABC"
   (set-info (name A) (elements 1 2 3) (is-subset-of B))
   (set-info (name B) (elements 1 2 3 red green) (is-subset-of none))
   (set-info (name C) (elements red green yellow blue) (is-subset-of none)))