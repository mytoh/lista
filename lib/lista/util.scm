
(define-module lista.util
  (export
    define-ls-proc
    )
  (use file.util)
  (use util.list))
(select-module lista.util)


(define-syntax define-ls-proc
  (syntax-rules ()
    ((_ name ls directories allfiles dfirst)
     (define (name directories allfiles dfirst)
       (cond
         ((null? directories)
          (ls (current-directory) allfiles dfirst))
         (else
           (let loop ((dirs directories))
             (cond
               ((null? dirs)
                (values))
               (else
                 (ls (car dirs) allfiles dfirst)
                 (loop (cdr dirs)))))))))))
