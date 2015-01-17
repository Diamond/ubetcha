Ubetcha
#######

Database Design
===============

User
----
  + username:string
  + email:string
  + password:string
  + points:integer
  - has_many outcomes
  - has_many wagers

Bet
---
  + name:string
  + status:string
  - belongs_to user: user_id
  - has_many outcomes

Outcome
-------
  + name:string
  + win:string
  - belongs_to bet: bet_id

Wager
-----
  + amount
  - belongs_to user: user_id
  - belongs_to bet: bet_id
  - belongs_to outcome: outcome_id 

Stories
=======

[] A **user** can be created
[] A **user** starts off with a default of 100 points
[] A **user** can create a **bet** with an entered name
  [] - For each **bet**, the creator can add an **outcome**
  [] - Only one **outcome** can win
[] A **user** can place a **wager** on a **outcome** for a **bet**
[] A **bet** can be placed by the **user** into _open_ status
[] A **bet** can be placed by the **user** into _closed_ status
[] A copy of a **bet** should be able to be recreated
[] When a **bet** is _closed_, an **outcome** must have its _win_ flag set to true, and all others set to _false_
[] When a **bet** is _closed_, winnings and losses are added/deducted from the **user** __points__
[] For a set of **bets** from a **user**, leaderboards should be visible

Other Goals (?)
===============

  - Integration with twitch.tv oauth
  - Bonuses for follow/subscribe
  - Cashin options for points
  - What happens when a user runs out of points
  - Leaderboards per bet creator (user)
  - Global leaderboards
    - Both leaderboards cached to redis?
