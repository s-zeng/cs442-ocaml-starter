open! Core
open! Cs442

let%expect_test "2 sum empty list" =
  print_s [%sexp (Twosum.two_sum ~nums:[] ~target:10 : (int * int) list)];
  [%expect {| () |}]
;;

let%expect_test "2 sum 2 answers" =
  print_s
    [%sexp
      (Twosum.two_sum ~nums:[ 1; 17; 24; -5; 110; 46 ] ~target:41 : (int * int) list)];
  [%expect {| ((2 1) (5 3)) |}]
;;

let%test_unit "2 sum quickcheck" =
  let twosum_args_generator =
    let open Quickcheck.Generator.Let_syntax in
    let%bind nums = List.quickcheck_generator Int.quickcheck_generator in
    let%bind target = Int.quickcheck_generator in
    return (nums, target)
  in
  let f (nums, target) =
    Twosum.two_sum ~nums ~target
    |> List.iter ~f:(fun (i, j) ->
         let summed =
           let open Option.Let_syntax in
           let%bind i_value = List.nth nums i in
           let%bind j_value = List.nth nums j in
           return (i_value + j_value)
         in
         [%test_result: int option] summed ~expect:(Some target))
  in
  Quickcheck.test twosum_args_generator ~f
;;
