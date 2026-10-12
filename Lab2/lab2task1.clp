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

(deffacts family-facts "Family"
   (person-gender (name Tom) (gender male))
   (person-gender (name Susan) (gender female))
   (person-gender (name John) (gender male))
   (family-role (name Tom) (role father))
   (family-role (name Susan) (role mother))
   (family-role (name John) (role son))
   (parent-child (child John) (father Tom) (mother Susan)))