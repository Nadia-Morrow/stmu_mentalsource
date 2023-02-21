/* Nadia Morrow
 * Mobile Development
 * Last Updated: 12/1/22
 * This page is creates class to create the maze combining the outline with the walls.
 */
enum ImageType {
  asset
}

class MazeItem {
  MazeItem(this.path, this.type);

  ImageType type;

  String path;
}