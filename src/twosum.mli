open! Core

(** Finds every pair of indices (i, j) with i > j such that nums[i] + nums[j] = target *)
val two_sum : nums:int list -> target:int -> (int * int) list
