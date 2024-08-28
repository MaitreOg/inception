Before starting the program, please modify the following fields:

-the USER variable in Makefile
-the USER variable in .env
-redirect smarty.42.fr to localhost to do this type sudo vim 
/etc/hosts and add the line "127.0.0.1 smarty.42.fr"


Now you can start the program using the Makefile

-use make for build containers and start program
-use make fclean for remove all about containers
-use make stop for stop containers

Once the program has run, go to your browser and enter 
https://smarty.42.fr, you're now on my Inception.

Once you've finished using docker, don't forget to remove 
the redirection from smarty.42.fr to localhost in /etc/hosts
