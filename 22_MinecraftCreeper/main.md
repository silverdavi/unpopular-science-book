In 1962, programmers controlled individual pixels. \emph{Spacewar!} on the PDP-1 computed each dot's position: x + dx, y + dy. The electron beam drew vectors where the math said. No abstraction layers, no graphics libraries. Raw coordinates to phosphor.

Early arcade machines hardcoded everything. \emph{Space Invaders} (1978) had separate code for each alien type's movement, each collision check, each point calculation. One function moved the bottom row left. Another moved the middle row. A third handled the top row. Adding a new enemy type meant writing new functions for every system it touched.

Programmers noticed repetition. Moving objects needed position and velocity. Visible objects needed drawing routines. Destructible objects needed health. \emph{Adventure} (1979) on the Atari 2600 consolidated these patterns. Dragons, bats, and keys became entries in an object table: position, size, color, behavior ID. One collision handler checked all interactions by comparing behavior IDs.

This table-driven design scaled. \emph{Pac-Man}'s four ghosts used one movement function with different targets. Blinky: current position. Pinky: four tiles ahead. Inky: 2×(Blinky + 2 ahead) - Blinky. Clyde: chase when far, flee when near. Four personalities from one algorithm.

Object-oriented programming arrived in games during the 1990s. \emph{Doom} built an actor system where every monster inherited from a base class. The imp and the baron shared the same state machine code. Only the data differed: health (60 vs 1000), projectile type (fireball vs plasma), pain chance (200/256 vs 50/256). New monsters combined existing actions with new sprites.

By 2000, inheritance hierarchies hit limits. A FlyingEnemy couldn't share code with a FlyingProjectile without multiple inheritance. Entity-component systems replaced deep hierarchies. An entity became an ID. Components became data: Position, Velocity, Sprite, Health. Systems processed components: MovementSystem updated Position + Velocity, RenderSystem drew Position + Sprite.

Game engines emerged as reusable frameworks. Rendering, physics, audio, input — each became a module. id Tech, Unreal Engine, Unity provided the infrastructure. Developers focused on content, not engine code. The shift from "build everything" to "configure existing systems" was complete.

\emph{Minecraft} epitomized this evolution. Markus Persson didn't code mining animations or crafting cutscenes. He built systems: blocks with properties, items with behaviors, entities with AI tasks. Place block, break block, update neighbors. The game provided rules. Players created the experience.

Every block type registered behaviors. Sand checked for air below, then fell. Water checked for lower neighbors, then flowed. Redstone carried signals 15 blocks, torches inverted them. From these simple rules emerged computers, calculators, music boxes — constructions Persson never imagined. The programmer set the stage, the players set the game.

Entities followed the same philosophy. The Entity class defined position and velocity. LivingEntity added health. Mob added AI tasks — small programs that ran each tick. Zombies had [AttackPlayerTask, WanderTask]. Sheep had [EatGrassTask, FollowParentTask]. Combine tasks differently, get different creatures.

Among these creatures was the Creeper — \emph{Minecraft}'s most recognizable enemy. Silent, green, explosive. It approaches without warning and detonates on proximity, destroying player constructions. No other mob behaves like it. No footsteps, no growls, just a hiss before detonation.

The Creeper began as a pig. In 2009, Persson was modeling a pig in his 3D editor. The pig model needed dimensions: length 2.0, height 1.0, width 1.0. But when entering the values, he swapped length and height. Instead of a horizontal rectangle with legs, he got a vertical pillar. The model loaded without crashing — \emph{Minecraft}'s renderer displayed whatever vertices it received. He textured it green using the grass texture, added a frown, kept it as a joke. Then he made it hostile, copying TNT's explosion code and binding it to proximity detection. No footstep sounds were assigned. The accidental pig became the Creeper.

This was not the only time bugs became gameplay elements:

**Street Fighter II** — Combos originated from a timing bug. Recovery windows overlapped with input windows, allowing moves to chain. Players discovered it, Capcom kept it.

**Quake** — Rocket jumping came from explosion physics affecting the player. Firing at your feet launched you higher than intended. It became core movement tech.

**Grand Theft Auto** — Started as a racing game. A bug made police AI overly aggressive. Playtesters preferred the chaotic police chases to racing.

**Devil May Cry** — The juggling system came from testing Onimusha. A bug let players keep enemies airborne indefinitely. Capcom liked it so much they built a new game around it.

**Space Invaders** — The accelerating tempo wasn't designed. Fewer aliens meant less processing, so the game ran faster. The increasing difficulty was accidental.

**Nuclear Gandhi (Civilization)** — Gandhi's aggression value was 1. Adopting democracy subtracted 2, causing an underflow to 255 — maximum aggression. The peaceful leader became nuclear-obsessed.

**Skiing (Tribes)** — Players discovered that rapidly tapping jump while moving downhill maintained momentum. The physics bug became the defining movement mechanic.

**Silent Hill** — The PlayStation couldn't render distant objects. Developers added fog to hide pop-in. The limitation created the series' signature atmosphere.

**Super Smash Bros. Melee** — Wavedashing emerged from air-dodging diagonally into the ground. Players could slide while attacking. Nintendo kept it for competitive depth.

Bugs that improve gameplay survive. Bugs that frustrate get patched. The difference isn't the code — it's player response. When systems are flexible enough to handle unexpected states, accidents become features.