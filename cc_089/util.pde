void drawPoint(int x, int y) {
  int a = (int)map(x, 0, gridSizeX, 0, width);
  int b = (int)map(y, 0, gridSizeY, 0, height);
  int diameterX = (int)map(1, 0, gridSizeX, 0, width);
  int diameterY = (int)map(1, 0, gridSizeY, 0, height);
  ellipse(a + diameterX / 2, b + diameterY / 2, diameterX, diameterY);
}
