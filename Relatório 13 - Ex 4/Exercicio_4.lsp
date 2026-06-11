(defstruct local
  nome
  elemento
  dificuldade
  recompensa)


(defun bonus-elemental (local)
  (cond
    ((or (string= (local-elemento local) "Pyro")
         (string= (local-elemento local) "Electro"))
     (* (local-recompensa local) 1.20))

    ((string= (local-elemento local) "Cryo")
     (* (local-recompensa local) 1.10))

    (t
     (local-recompensa local))))

(defun compensa (local)
  (and
   (> (bonus-elemental local) 500)
   (<= (local-dificuldade local) 3)))

(defun descricao-local (local)
  (format nil
          "Nome: ~A | Elemento: ~A | Dificuldade: ~A | Recompensa Bonus: ~,2F"
          (local-nome local)
          (local-elemento local)
          (local-dificuldade local)
          (bonus-elemental local)))

(defun rota-de-farm (catalogo)
  (mapcar
   #'(lambda (local)
       (format nil
               "~A - Recompensa: ~,2F"
               (local-nome local)
               (bonus-elemental local)))
   (remove-if-not #'compensa catalogo)))

(let ((catalogo
       (list

        (make-local
         :nome "Pyro Regisvine"
         :elemento "Pyro"
         :dificuldade 3
         :recompensa 500)

        (make-local
         :nome "Electro Hypostasis"
         :elemento "Electro"
         :dificuldade 2
         :recompensa 600)

        (make-local
         :nome "Cryo Regisvine"
         :elemento "Cryo"
         :dificuldade 3
         :recompensa 550)

        (make-local
         :nome "Oceanid"
         :elemento "Hydro"
         :dificuldade 4
         :recompensa 700)

        (make-local
         :nome "Stormterror"
         :elemento "Anemo"
         :dificuldade 2
         :recompensa 450))))

  (format t "=== Catalogo Completo ===~%")

  (mapc
   #'(lambda (local)
       (format t "~A~%"
               (descricao-local local)))
   catalogo)

  (format t "~%=== Rota de Farm Recomendada ===~%")

  (mapc
   #'(lambda (linha)
       (format t "~A~%" linha))
   (rota-de-farm catalogo)))
