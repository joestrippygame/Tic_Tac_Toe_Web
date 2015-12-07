A web app to play a game of tic tac toe against the computer or another (local) player.

The Negamax algorithm has been integrated into the game, along with 3 choices for level of difficulty.
It needs a ton of refactoring, I know it's not pretty, but it works.

Running index.html opens the home page.  Once you go to the tic tac toe game page (start frontend.rb in
sanatra first) you will notice that click on the home or rules button gives an error.  This is because
the index and rules page are local files, if they were an html link (like minedminds.org) we would not
have this issue.  Setting the anchor links to file:\\\path doesn't seem to work either.  

I haven't had a chance to do TDD on Negamax yet either, but I can tell you that after several games I have 
not beaten the computer yet!