;; ==========================================
;; 1. DEFINIÇÃO DOS TIPOS E CONSTRUTORES
;; ==========================================

;; Em Lisp, para a "Periculosidade", usamos símbolos (:baixa, :media, :alta).
;; Não precisamos de um tipo rígido, mas podemos criar uma função para validar se desejado.

(defstruct criatura
  nome
  ambiente
  periculosidade
  vida-media)

;; ==========================================
;; 2. FUNÇÕES DE FILTRAGEM E RELATÓRIO
;; ==========================================

;; Implementa filtraPorPerigo :: [Criatura] -> [Criatura]
(defun filtra-por-perigo (lista-criaturas)
  (remove-if-not (lambda (c)
                   (not (eq (criatura-periculosidade c) :baixa)))
                 lista-criaturas))

;; Implementa relatorioProfundidade :: [Criatura] -> [String]
(defun relatorio-profundidade (lista-criaturas)
  (let ((criaturas-deep (remove-if-not (lambda (c)
                                         (string-equal (criatura-ambiente c) "Deep"))
                                       lista-criaturas)))
    (mapcar (lambda (c)
              (format nil "[~A]: Vive em [~A]" 
                      (criatura-nome c) 
                      (criatura-ambiente c)))
            criaturas-deep)))

;; Implementa descricaoCriatura :: Criatura -> String
(defun descricao-criatura (c)
  (format nil "Nome: ~A | Ambiente: ~A | Perigo: ~A"
          (criatura-nome c)
          (criatura-ambiente c)
          (symbol-name (criatura-periculosidade c))))

;; ==========================================
;; 3. FUNÇÃO MAIN (EXECUÇÃO CENTRAL)
;; ==========================================

(defun main ()
  ;; Definição do catálogo com pelo menos 4 criaturas
  (let ((catalogo (list
                   (make-criatura :nome "Peeper" 
                                  :ambiente "Safe Shallows" 
                                  :periculosidade :baixa 
                                  :vida-media 5)
                   (make-criatura :nome "Reaper Leviathan" 
                                  :ambiente "Crash Zone" 
                                  :periculosidade :alta 
                                  :vida-media 100)
                   (make-criatura :nome "Ghost Leviathan" 
                                  :ambiente "Deep" 
                                  :periculosidade :alta 
                                  :vida-media 150)
                   (make-criatura :nome "Crabsquid" 
                                  :ambiente "Deep" 
                                  :periculosidade :media 
                                  :vida-media 40))))

    ;; 1. Exibir o catálogo completo
    (format t "--- CATÁLOGO COMPLETO ---~%")
    (dolist (c catalogo)
      (format t "~A~%" (descricao-criatura c)))

    ;; 2. Exibir criaturas perigosas filtradas (não-baixas)
    (format t "~%--- CRIATURAS PERIGOSAS FILTRADAS ---~%")
    (let ((perigosas (filtra-por-perigo catalogo)))
      (dolist (c perigosas)
        (format t "~A~%" (descricao-criatura c))))

    ;; 3. Exibir o relatório de profundidade
    (format t "~%--- RELATÓRIO DE PROFUNDIDADE (\"Deep\") ---~%")
    (let ((relatorio (relatorio-profundidade catalogo)))
      (dolist (linha relatorio)
        (format t "~A~%" linha)))))

;; Executa o programa
(main)
