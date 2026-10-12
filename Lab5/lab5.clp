(deftemplate father-of (slot father) (slot child))
(deftemplate mother-of (slot mother) (slot child))
(deftemplate male (slot person))
(deftemplate female (slot person))
(deftemplate wife-of (slot wife) (slot husband))
(deftemplate husband-of (slot husband) (slot wife))

(deftemplate parent-of (slot parent) (slot child))
(deftemplate brother-of (slot brother) (slot person))
(deftemplate sister-of (slot sister) (slot person))
(deftemplate grandparent-of (slot grandparent) (slot grandchild))
(deftemplate grandfather-of (slot grandfather) (slot grandchild))
(deftemplate grandmother-of (slot grandmother) (slot grandchild))
(deftemplate uncle-of (slot uncle) (slot person))
(deftemplate aunt-of (slot aunt) (slot person))
(deftemplate cousin-of (slot cousin) (slot person))
(deftemplate ancestor-of (slot ancestor) (slot descendant))

;; Правила для parent-of
(defrule infer-parent-father
  (father-of (father ?f) (child ?c))
  =>
  (assert (parent-of (parent ?f) (child ?c))))

(defrule infer-parent-mother
  (mother-of (mother ?m) (child ?c))
  =>
  (assert (parent-of (parent ?m) (child ?c))))

;; д) sister (сестра), brother (брат)
(defrule infer-brother
  (parent-of (parent ?p) (child ?c1))
  (parent-of (parent ?p) (child ?c2&~?c1))
  (male (person ?c1))
  =>
  (assert (brother-of (brother ?c1) (person ?c2))))

(defrule infer-sister
  (parent-of (parent ?p) (child ?c1))
  (parent-of (parent ?p) (child ?c2&~?c1))
  (female (person ?c1))
  =>
  (assert (sister-of (sister ?c1) (person ?c2))))

;; в) grandparent (дідусь або бабуся)
(defrule infer-grandparent
  (parent-of (parent ?gp) (child ?p))
  (parent-of (parent ?p) (child ?gc))
  =>
  (assert (grandparent-of (grandparent ?gp) (grandchild ?gc))))

;; г) grandfather (дідусь), grandmother (бабуся)
(defrule infer-grandfather
  (grandparent-of (grandparent ?gp) (grandchild ?gc))
  (male (person ?gp))
  =>
  (assert (grandfather-of (grandfather ?gp) (grandchild ?gc))))

(defrule infer-grandmother
  (grandparent-of (grandparent ?gp) (grandchild ?gc))
  (female (person ?gp))
  =>
  (assert (grandmother-of (grandmother ?gp) (grandchild ?gc))))

;; а) uncle (дядько), aunt (тітка)
;; Дядько по крові
(defrule infer-uncle-blood
  (parent-of (parent ?p) (child ?c))
  (brother-of (brother ?u) (person ?p))
  =>
  (assert (uncle-of (uncle ?u) (person ?c))))

;; Дядько по шлюбу (чоловік кровної тітки)
(defrule infer-uncle-marriage
  (aunt-of (aunt ?a) (person ?c))
  (husband-of (husband ?u) (wife ?a))
  =>
  (assert (uncle-of (uncle ?u) (person ?c))))

;; Тітка по крові
(defrule infer-aunt-blood
  (parent-of (parent ?p) (child ?c))
  (sister-of (sister ?a) (person ?p))
  =>
  (assert (aunt-of (aunt ?a) (person ?c))))

;; Тітка по шлюбу (дружина кровного дядька)
(defrule infer-aunt-marriage
  (uncle-of (uncle ?u) (person ?c))
  (wife-of (wife ?a) (husband ?u))
  =>
  (assert (aunt-of (aunt ?a) (person ?c))))

;; б) cousin (двоюрідний брат/сестра)
(defrule infer-cousin
  (parent-of (parent ?p1) (child ?c1))
  (parent-of (parent ?p2) (child ?c2))
  (brother-of (brother ?p1) (person ?p2)) ; батьки є братами/сестрами
  =>
  (assert (cousin-of (cousin ?c1) (person ?c2))))

(defrule infer-cousin-2
  (parent-of (parent ?p1) (child ?c1))
  (parent-of (parent ?p2) (child ?c2))
  (sister-of (sister ?p1) (person ?p2)) ; якщо батьки - сестри (додано для покриття)
  =>
  (assert (cousin-of (cousin ?c1) (person ?c2))))

;; е) ancestor (предок)
;; Прямий предок (батько/мати)
(defrule infer-ancestor-direct
  (parent-of (parent ?a) (child ?p))
  =>
  (assert (ancestor-of (ancestor ?a) (descendant ?p))))

;; Предок через покоління
(defrule infer-ancestor-recursive
  (ancestor-of (ancestor ?a) (descendant ?p1))
  (parent-of (parent ?p1) (child ?p2))
  =>
  (assert (ancestor-of (ancestor ?a) (descendant ?p2))))

(deffacts test-family-tree
  (male (person Robert))
  (female (person Mary))
  (male (person Mark))
  (female (person Sarah))
  (male (person David))
  (male (person Kevin))
  (female (person Lily))
  (male (person Luke))

  (father-of (father Robert) (child Mark))
  (father-of (father Robert) (child Sarah))
  (mother-of (mother Mary) (child Mark))
  (mother-of (mother Mary) (child Sarah))

  (father-of (father Mark) (child Kevin))
  (father-of (father Mark) (child Lily))

  (mother-of (mother Sarah) (child Luke))
  (father-of (father David) (child Luke))

  (wife-of (wife Sarah) (husband David))
  (husband-of (husband David) (wife Sarah))
)