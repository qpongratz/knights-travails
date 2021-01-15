# knights-travails
Project to learn more about searches with The Odin Project

A program that calculates and displays the shortest path
between two positions according to a knight's moveset.

No user interaction, but change the values in the called knights_move method to see different results. Does not check to make sure end and start states are valid moves since its not getting user input, so will loop infinitely trying to get to a space it cannot reach. Can accomodate different board sizes if you change the bounds on MoveNode.valid? method.

Learning goals: 
  Utilize concepts just learned: 
    binary search tree, stack, queue, recursion, linked lists

Notes:
  Got stumped on this one for a good bit. I knew I wanted to use a BFS almost immediately. You could use a DFS (I think) if you made spaces visited impossible to revisit, but you would have to search every branch to make sure you had the shortest one. Instead searching the tree laterally, you could just stop when you see a spot that matches your desired end-state.

  What I struggled with, was I was thinking of a tree as I had used in the Binary Search Tree project. In that, each element pointed towards their two children. The only way I could think of how to trace the path once I had found a node that represented the end state was to do a find method like I had in that project. But it felt impossible to actually look for a node on the tree when the tree was grouped only by relationship and not by comparing their values like in the previous exercise. I considered each node being imbued with a history passed down from its parent and adding its own position to it. That probably would have worked, but I'm glad I didn't fully go down that path as it seems messy compared to where I ended up eventually.

  My breakthrough with this was to just reverse the relationship between parent and child nodes. Child node stores what its parent was, and then once you get a node that's position matches end position, it just traces up its lineage.

  I did do a long detour in my planning about how best to catalog and store board spaces. Should they be coordinates? Should they be spaces in a 64 length array representing the board? If coordinates should they start with 0 or 1? None of which really mattered for the end solution of this project, but thinking about these things I think will be beneficial when I get to the full Chess project later in The Odin Project.

  Right now the speed of the program is fine. If I wanted to accomodate bigger board sizes, I would probably implement an array to keep track of which spaces had been visited so you can eliminate those from possible moves when a node generates its children.