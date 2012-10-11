
(define-module lista.env
  (export
    *config*
    *colour-theme*
    *extension-colours*
    *colours*
    *normal-file-colours*
    )
  (use kirjasto.config)
  (use file.util)
  (use util.list))
(select-module lista.env)

(define *config* (read-config
                   (build-path (home-directory) ".lista" "config")))
(define *colour-theme*
  (cadr  (find (lambda (e) (equal? (car e) '*colour-theme*))
                             *config*)))
(define *extension-colours*
  (assoc-ref *config* '*extension-colours*))

(define *normal-file-colours*
  (assoc-ref *config* '*normal-file-colours*))

(define *colours*
  (read-config
    (build-path (home-directory) ".lista" "themes" *colour-theme*)))


