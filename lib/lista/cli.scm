":"; exec gosh -- $0 "$@"

;; lesser copy of ls++ by trapd00r
;; colour codes are hardcoded so edit this file

(define-module lista.cli
  (export runner)
  (use util.match)
  (use gauche.parseopt)
  (use lista.core)
  (use lista.commands)
  )
(select-module lista.cli)





(define (usage)
  (print "help"))

(define (runner args)
  (let-args (cdr args)
    ((pf "pf|perm-file")
     (ptf "ptf|perm-time-file")
     (ptsf "ptsf|perm-time-size-file")
     (pof "pof|perm-owner-file")
     (psf "psf|perm-size-file")
     (posf "posf|perm-owner-size-file")
     (potsf "potsf|perm-owner-time-size-file")
     (all "a|all")
     (dfirst "d|directory-first")
     . directories)
    (cond
      (pf (ls-perm-file directories all dfirst))
      (ptf (ls-perm-time-file directories all dfirst))
      (ptsf (ls-perm-time-size-file directories all dfirst))
      (pof (ls-perm-owner-file directories all dfirst))
      (posf (ls-perm-owner-size-file directories all dfirst))
      (potsf (ls-perm-owner-time-size-file directories all dfirst))
      (psf (ls-perm-size-file directories all dfirst))
      (dfirst (ls-file directories all dfirst))
      (else (ls-file directories all dfirst))))
  0)
