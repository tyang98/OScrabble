(** [t] is the type of a tile inventory. *)
type t

(** [tile] is the type of a tile. *)
type tile = Letter of char | Blank

(** [next_tile t] is the next tile to be drawn from the tile inventory, 
    followed by a tile inventory with the tile [tile] removed. *)
val next_tile : t -> tile option * t

(** [from_file f] is the list of possible tiles read from the file [f]. *)
val from_file : string -> t

(** [string_of_tile t] is the string representing the eitherthe letter 
    on tile [t] or a blank tile. *)
val string_of_tile : tile -> string