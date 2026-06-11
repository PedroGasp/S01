(defun cria-erva (nome preco-base)
  (list nome preco-base))

(defun nome-erva (erva)
  (first erva))

(defun preco-base-erva (erva)
  (second erva))

(defun calcula-dosagem (peso idade)
  (cond
    ((or (< idade 12) (< peso 40)) "10ml")
    ((or (< idade 18) (< peso 70)) "25ml")
    (t "50ml")))

(defun ajusta-preco (erva)
  (cond
    ((string= (nome-erva erva) "Ginseng")
     (* (preco-base-erva erva) 3.0))
    ((string= (nome-erva erva) "Lotus")
     (* (preco-base-erva erva) 1.5))
    (t
     (preco-base-erva erva))))

(defun descricao-erva (erva peso idade)
  (format nil
          "Erva: ~A | Preco: ~,2F | Dosagem: ~A"
          (nome-erva erva)
          (ajusta-preco erva)
          (calcula-dosagem peso idade)))

(let ((ginseng (cria-erva "Ginseng" 20))
      (lotus (cria-erva "Lotus" 15))
      (camomila (cria-erva "Camomila" 10)))

  (format t "~A~%" (descricao-erva ginseng 30 10))
  (format t "~A~%" (descricao-erva lotus 60 16))
  (format t "~A~%" (descricao-erva camomila 80 25)))
