;; BitContent: Decentralized Digital Content Marketplace
;; A secure and compliant marketplace for trading digital content 
;; on the Stacks blockchain with Bitcoin settlement assurances.
;;
;; This contract enables content creators to securely sell digital assets,
;; while providing buyers with guaranteed access to purchased content.
;; Built with Stacks L2 scalability and Bitcoin compliance in mind.

;; Constants
(define-constant owner-address tx-sender)
(define-constant ERR_UNAUTHORIZED (err u201))
(define-constant ERR_ITEM_UNAVAILABLE (err u202))
(define-constant ERR_DUPLICATE_ITEM (err u203))
(define-constant ERR_INSUFFICIENT_FUNDS (err u204))
(define-constant ERR_SELF_TRADE_BLOCKED (err u205))
(define-constant ERR_PRICE_INVALID (err u206))
(define-constant ERR_INPUT_INVALID (err u207))

;; Data Maps

;; Content offerings store the core metadata and trading parameters
(define-map content-offerings
  { item-id: uint }
  {
    owner: principal,
    price-tag: uint,
    content-summary: (string-ascii 256),
    content-type: (string-ascii 64),
    tradeable: bool,
    creation-block: uint,
  }
)

;; Trader metrics track participant reputation and activity
(define-map trader-metrics
  { participant: principal }
  {
    trade-count: uint,
    quality-score: uint,
    last-active: uint,
  }
)

;; Exchange records maintain transaction history
(define-map exchange-records
  {
    customer: principal,
    item-id: uint,
  }
  {
    timestamp: uint,
    cost: uint,
    merchant: principal,
  }
)
