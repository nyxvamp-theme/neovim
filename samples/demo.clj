;; Simple Clojure theme with atoms
(ns theme)

(def variants
  {:veil     {:bg "#1E1E2E" :fg "#D9E0EE"}
   :obsidian {:bg "#000A0F" :fg "#C0C0CE"}
   :radiance {:bg "#F7F7FF" :fg "#1E1E2E"}})

(def current (atom :veil))

(defn get-colors []
  (get variants @current))

(defn set-theme! [variant]
  (when (contains? variants variant)
    (reset! current variant)
    (println "Theme:" (name variant))))

(defn apply-theme [& {:keys [transparent?]}]
  (let [colors (get-colors)
        bg (if transparent? "none" (:bg colors))]
    {:background bg :foreground (:fg colors)}))

;; Usage:
;; (set-theme! :obsidian)
;; (apply-theme :transparent? true)