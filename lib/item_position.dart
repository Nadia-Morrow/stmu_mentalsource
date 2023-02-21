/* Nadia Morrow
 * Mobile Development
 * Last Updated: 12/1/22
 * This page creates class used to build the maze grid.
 */
import 'package:equatable/equatable.dart';

class ItemPosition extends Equatable {
  ItemPosition({required this.col, required this.row});

  final int col;

  final int row;

  @override
  List<Object> get props => [col, row];
}