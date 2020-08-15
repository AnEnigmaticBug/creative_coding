enum Direction { N, E, S, W }

class Ant {
  int x, y;
  Direction direction;
  int boundX, boundY;
  
  Ant(int x, int y, Direction direction, int boundX, int boundY) {
    this.x = x;
    this.y = y;
    this.direction = direction;
    this.boundX = boundX;
    this.boundY = boundY;
  }
  
  void turnLt() {
    switch (direction) {
      case N: direction = Direction.W; break;
      case E: direction = Direction.N; break;
      case S: direction = Direction.E; break;
      case W: direction = Direction.S; break;
    }
  }
  
  void turnRt() {
    switch (direction) {
      case N: direction = Direction.E; break;
      case E: direction = Direction.S; break;
      case S: direction = Direction.W; break;
      case W: direction = Direction.N; break;
    }
  }
  
  void moveForward() {
    switch (direction) {
      case N: y = Math.floorMod(y - 1, boundY); break;
      case E: x = Math.floorMod(x + 1, boundX); break;
      case S: y = Math.floorMod(y + 1, boundY); break;
      case W: x = Math.floorMod(x - 1, boundX); break;
    }
  }
}
