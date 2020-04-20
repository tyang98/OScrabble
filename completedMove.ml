module type LetterValueMap = sig 
  type t

  val get : char -> int
end 

let split (s : string) : char list = 
  List.init (String.length s) (String.get s) 

module CompletedMove = 
  functor (LetterVal : LetterValueMap) -> struct
    type t = (string * (char * int) list * int list) list

    module LV = LetterVal




    let score m = 
      List.fold_left (+) 0 
        (
          m |> List.map (fun (str, lb, wb) -> (split str, lb, wb))
          |> List.map (
            fun (chrs, lb, wb) -> 
              (List.map 
                 (fun x -> 
                    (LV.get x) * 
                    (
                      List.assoc_opt x lb 
                      |> function | Some r -> r | None -> 1
                    )
                 ) chrs 
               |> List.fold_left (+) 0, wb ))
          |> List.map 
            (fun (i, wb) -> i * (List.fold_left (fun a b -> a * b) 1 wb))
        )



    let words m = 
      failwith "Unimplemented"
  end