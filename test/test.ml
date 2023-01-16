open! Core

let%expect_test "test" =
  Cs442.main ();
  [%expect {| HUZZAH! |}];
  let x = 3 + 4 in
  let some_list = List.map ~f:(fun n -> n * n) [ 1; 2; 3; 4 ] in
  print_s [%message (x : int) (some_list : int list)];
  [%expect {| ((x 7) (some_list (1 4 9 16))) |}]
;;
