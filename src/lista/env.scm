
(define-module lista.env
  (export
    *config*
    *colour-theme*
    *extension-colours*
    *colours*
    *normal-file-colours*
    )

  (use file.util)
  (use util.list))
(select-module lista.env)

(define *config* (call-with-input-file
                   (build-path (home-directory) ".ls/config")
                   read))
(define *colour-theme*
  (cadr  (find (lambda (e) (equal? (car e) '*colour-theme*))
                             *config*)))
(define *extension-colours*
  (assoc-ref *config* '*extension-colours*))

(define *normal-file-colours*
  (assoc-ref *config* '*normal-file-colours*))

(define *colours*
  (with-input-from-file
    (build-path (home-directory) ".ls/themes" *colour-theme*)
    read))


