final int gridSizeX = 40;
final int gridSizeY = 40;

int[][] grid;
Ant ant;

void setup() {
  grid = new int[gridSizeX][gridSizeY];
  ant = new Ant(gridSizeX / 2, gridSizeY / 2, Direction.N, gridSizeX, gridSizeY);
  
  size(800, 800);
  noStroke();
  background(30);
  
  for (int x = 0; x < gridSizeX; x++) {
    for (int y = 0; y < gridSizeY; y++) {
      fill(200, 220, 0, 200);
      drawPoint(x, y);
    }
  }
}

void draw() {
  if (grid[ant.x][ant.y] == 0) {
    fill(30);
    drawPoint(ant.x, ant.y);
    fill(120, 10, 80, 200);
    drawPoint(ant.x, ant.y);
    
    grid[ant.x][ant.y] = 1;
    ant.turnRt();
    ant.moveForward();
  }
  if (grid[ant.x][ant.y] == 1) {
    fill(30);
    drawPoint(ant.x, ant.y);
    fill(200, 220, 0, 200);
    drawPoint(ant.x, ant.y);
    
    grid[ant.x][ant.y] = 0;
    ant.turnLt();
    ant.moveForward();
  }
  
  fill(220, 0, 0);
  drawPoint(ant.x, ant.y);
}

void mousePressed() {
  saveFrame("screenshots/s###.png");
}
