/*
Nadia Morrow
Mobile Development
Last Updated: 12/1/22
This page creates the class that makes the class used to create the sections of the walls.
 */
class Cell {
  Cell(this.col, this.row);

  bool bottomWall = true;

  bool leftWall = true;

  bool rightWall = true;

  bool topWall = true;

  bool visited = false;

  int col;

  int row;
}