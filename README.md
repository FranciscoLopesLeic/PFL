# PFL
Programação Funcional Lógica

## Game Map

Flügelrad is played on a 7-hexagonal-space game board, with each space having a hole in its center for the impeller wheel. The game is played with marbles, with each player having their own color. The marbles are placed and moved within the seven clusters on the board.

## Game Logic

The game is a two-player abstract strategy game. On their turn, players reposition and turn the impeller wheel, which can move up to six marbles at the same time in a clockwise manner within the seven clusters on the board. Players must be careful as they can easily move their opponent's marbles as well.
After a first play, the following player can not insert the wheel in the same hole as the first player.

## How a Player Wins

The objective of Flügelrad is to be the first player to form a contiguous cluster of at least six of their marbles. The clusters can be formed horizontally, vertically, or diagonally. Once a player has created a cluster of six or more marbles of their color, they win the game. Players must strategically position and move the impeller wheel to create and disrupt their opponent's clusters while working towards their own victory.

##1.Main

Here we call the main menu of the program:

![img_prolog1](https://github.com/FranciscoLopesLeic/PFL/assets/93835206/f7658807-8932-4837-bd65-5ccc38973bf4)

##2.Main_Menu

The main menu as the following options:
1 - play 1x1 - which doesen't initalize any computer related functions.
2 - play humanxcomputer - which initalizes computer related functions only for the second player.
3 - play computerxcomputer - which initalizes computer related functions for both.

##3. Game_loop

The game loop is represented here:

![img_prolog3](https://github.com/FranciscoLopesLeic/PFL/assets/93835206/a0b5f30d-414c-48ef-bcf1-36af13125089)
