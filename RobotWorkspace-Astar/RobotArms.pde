
/** 
 * TODO
 * 
 * Returns a single bar of a robot arm as a line segment. The starting joint
 * of the robot arm is at the center point parameter. The angle is theta, 
 * and the length of the robot arm is given by the lenght parameter. 
 * 
 * You should use the typical (r cos(theta), r sin(theta)) parametrization
 * of the unit circle.
 */
public Segment robot_joint(Point center, float theta, float length) {

//  Point ep = new Point(cos(theta)+length, sin(theta) + length);
  int x = (int)(length*cos(theta)) + center.x;
  int y = (int)(length*sin(theta)) + center.y;
  
  return new Segment(center, new Point(x, y));
}

/** 
 * TODO
 * 
 * Returns the robot arm segments in the work space given the configuration
 * space point p. The center of the robot should be at the point (900, 300).
 * The length of both arms should be 140. 
 *
 * Return an array containing the two segments of the robot arm. 
 */
Segment[] robot_arm(Point p) {
    Point center = new Point(900, 300);
    float length = 140;
    Segment first = robot_joint(center, p.theta1(), length);
    Segment second = robot_joint(first.q, p.theta2(), length);

    return new Segment[]{first, second};
}

/**
 * TODO
 * 
 * Draw the robot arm represented by the configuration space point p. 
 *
 * If a segment of the robot arm intersects any of the obstacles, draw it
 * green (which is the stroke color (0, 255, 0). Otherwise, draw it
 * with the stroke color (r, g, b). 
 */
void draw_robot_arm(Point p, int r, int g, int b) {

    // TODO
    if (is_valid_robot_arm(p)){
      stroke(r,g,b);
      }
    else {
      stroke(0,255,0);
      }

    for (Segment seg: robot_arm(p)){
      line(900, 300, seg.p.x , seg.p.y);
      //line(900, 300, seg.q.x , seg.q.y);
      line(seg.p.x, seg.p.y, seg.q.x, seg.q.y);
    }

}

/**
 * TODO
 *
 * Return true if the robot arm represented by the configuration point
 * does not intersect any obstacles. False otherwise. 
 */
boolean is_valid_robot_arm(Point p) {
  Segment[] arm = robot_arm(p);
  for (Segment seg: arm){
    if (seg.intersects_obstacles(obstacles)) return false;
  }
  return true;
}
