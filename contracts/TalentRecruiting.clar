;; TalentRecruiting: A decentralized platform for candidate endorsement
;; Core Data Structures
(define-map recruiters principal uint)        ;; Tracks recruiters and their endorsed candidates
(define-map candidates uint uint)             ;; Tracks candidates and their endorsement counts
(define-data-var candidate-counter uint u0)   ;; Keeps count of total registered candidates

;; Public function to register a new candidate
(define-public (register-candidate)
  (let ((candidate-id (+ (var-get candidate-counter) u1)))
    (map-set candidates candidate-id u0)      ;; Initialize endorsements for the new candidate to 0
    (var-set candidate-counter candidate-id)  ;; Increment candidate-counter
    (ok candidate-id)
  )
)

;; Public function to endorse a candidate
(define-public (endorse-candidate (candidate-id uint))
  (let ((recruiter tx-sender))
    (if (is-some (map-get? recruiters recruiter))
        (err u5000)  ;; Error: Recruiter has already endorsed a candidate
        (if (is-none (map-get? candidates candidate-id))
            (err u5001)  ;; Error: Candidate does not exist
            (begin
              ;; Register the recruiter's endorsement
              (map-set recruiters recruiter candidate-id)
              ;; Increment the candidate's endorsement count
              (map-set candidates candidate-id (+ (default-to u0 (map-get? candidates candidate-id)) u1))
              (ok candidate-id)
            )
        )
    )
  )
)

;; Read-only function to get total endorsements for a candidate
(define-read-only (get-endorsement-count (candidate-id uint))
  (default-to u0 (map-get? candidates candidate-id))
)

;; Read-only function to check if a recruiter has endorsed any candidate
(define-read-only (has-endorsed (recruiter principal))
  (is-some (map-get? recruiters recruiter))
)

;; Read-only function to get the total number of candidates
(define-read-only (get-candidate-count)
  (var-get candidate-counter)
)

;; Read-only function to compare two values
(define-read-only (compare-qualified (a uint) (b uint))
  (if (>= a b)
      a
      b
  )
)