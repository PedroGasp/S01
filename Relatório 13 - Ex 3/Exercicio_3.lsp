(defun cria-item (nome tipo preco forca-magica)
  (list nome tipo preco forca-magica))

(defun nome-item (item)
  (first item))

(defun tipo-item (item)
  (second item))

(defun preco-item (item)
  (third item))

(defun forca-magica-item (item)
  (fourth item))

(defun adicional-imposto (preco)
  (* preco 1.15))

(defun bonus-maldicao (forca-magica)
  (if (> forca-magica 80)
      (* forca-magica 1.5)
      forca-magica))

(defun descricao-venda (item)
  (format nil
          "Nome: ~A | Preco Final: ~,2F | Forca Magica: ~,2F"
          (nome-item item)
          (preco-item item)
          (forca-magica-item item)))

(defun processa-venda (catalogo)
  (mapcar
   #'descricao-venda
   (mapcar
    #'(lambda (item)
        (cria-item
         (nome-item item)
         (tipo-item item)
         (adicional-imposto (preco-item item))
         (bonus-maldicao (forca-magica-item item))))
    (remove-if-not
     #'(lambda (item)
         (string= (tipo-item item) "Arma"))
     catalogo))))

(let ((catalogo
       (list
        (cria-item "Espada Demonica" "Arma" 100 90)
        (cria-item "Arco Sombrio" "Arma" 80 70)
        (cria-item "Pocao de Cura" "Pocao" 25 20)
        (cria-item "Amuleto Antigo" "Artefato" 150 95)
        (cria-item "Machado Runico" "Arma" 120 85))))

  (format t "=== Relatorio de Vendas ===~%")

  (mapc #'(lambda (linha)
            (format t "~A~%" linha))
        (processa-venda catalogo)))
