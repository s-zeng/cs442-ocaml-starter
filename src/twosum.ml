open! Core

let two_sum ~nums ~target =
  let f i previously_seen value =
    let summing_pair =
      Map.find previously_seen (target - value)
      |> Option.map ~f:(Tuple.T2.create i)
    in
    Int.Map.set previously_seen ~key:value ~data:i, summing_pair
  in
  List.fold_mapi nums ~init:Int.Map.empty ~f |> Tuple.T2.get2 |> List.filter_opt
;;
