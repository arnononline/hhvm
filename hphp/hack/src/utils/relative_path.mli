(**
 * Copyright (c) 2014, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the "hack" directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 *
 *)

open Utils

type prefix =
  | Root
  | Hhi
  | Dummy

val path_of_prefix : prefix -> string
val set_path_prefix : prefix -> string -> unit

module S : sig
  type t
  val compare : t -> t -> int
  val to_string : t -> string
end

type t = S.t

val default : t
val create : prefix -> string -> t
val prefix : t -> prefix
val suffix : t -> string
val to_absolute : t -> string

module Set : module type of Set.Make (S)
module Map : module type of MyMap (S)

val relativize_set : prefix -> Utils.SSet.t -> Set.t
