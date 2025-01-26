/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 - Variable types: integer, float, boolean
 - Variable assignment
 - Printing variables
 - Variable checking
 
 In the assignment:
 - Add four more knots
 - Assign at least TWO new variables through player choices
 - Print at least one of the variables to the player in a passage
 - Check the value of a variable and have it do something
*/

// Variable declarations
VAR torch_pickup = false
VAR has_sword = false
VAR monster_defeated = false
VAR gold_collected = 0
VAR stamina = 75.0

-> cave_entrance

== cave_entrance ==
You stand at the entrance of a dark cave. {not torch_pickup:There is a torch lying on the ground.} 
The cave extends to the north and south.

+ [Enter the north tunnel] -> north_tunnel
+ [Enter the south tunnel] -> south_tunnel
* {not torch_pickup} [Pick up the torch] -> torch_pickup
+ [Check your status] -> status

== north_tunnel ==
You are in the north tunnel. The air feels damp, and you hear distant growling.
* {torch_pickup} [Light your torch] -> north_tunnel_lit
+ [Go Back] -> cave_entrance

== north_tunnel_lit ==
The light reveals a fierce cave monster blocking your path!
{has_sword: 
    * {not monster_defeated} [Fight the monster] -> fight_monster
}
+ [Retreat to the entrance] -> cave_entrance

== fight_monster ==
You bravely fight the monster with your sword!
~ monster_defeated = true
~ stamina -= 20.0
The monster is defeated, but you're feeling tired.
+ [Search for treasure] -> treasure_chamber
+ [Go Back] -> north_tunnel_lit

== treasure_chamber ==
You find a stash of gold hidden in the cave.
~ gold_collected += 200
+ [Go Back] -> north_tunnel_lit

== south_tunnel ==
You explore the south tunnel and discover an old weapon rack.
* {not has_sword} [Take a sword] -> take_sword
+ [Go Back] -> cave_entrance

== take_sword ==
You pick up a rusty sword. It might come in handy.
~ has_sword = true
+ [Go Back] -> south_tunnel

== status ==
Your current status:
{torch_pickup: Torch - provides light.}
{has_sword: Sword - useful for fighting.}
Gold: {gold_collected}
Stamina: {stamina}
+ [Return to the entrance] -> cave_entrance

=== torch_pickup ===
You now have a torch. This should help illuminate dark areas.
~ torch_pickup = true
+ [Go Back] -> cave_entrance

-> END
