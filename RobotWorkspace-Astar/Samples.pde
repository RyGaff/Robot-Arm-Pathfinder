ArrayList<Point> sample_points = new ArrayList<>();

Point nearestSampleTo(Point p) {
  int x, y;
  if (p.x % 10 <= 5) x = p.x - (p.x % 10);
  else x = p.x - (p.x % 10) + 10;
  if (p.y % 10 <= 5) y = p.y - (p.y % 10);
  else y = p.y - (p.y % 10) + 10;
  return new Point(x, y);
}

Point sampleAbove(Point sample) {
  return new Point(sample.x, sample.y == 10 ? 580 : sample.y - 10);
}

Point sampleBelow(Point sample) {
  return new Point(sample.x, sample.y == 590 ? 20 : sample.y + 10);
}

Point sampleRight(Point sample) {
  return new Point(sample.x == 590 ? 20: sample.x + 10, sample.y);
}

Point sampleLeft(Point sample) {
  return new Point(sample.x == 10? 580 : sample.x - 10, sample.y);
}
