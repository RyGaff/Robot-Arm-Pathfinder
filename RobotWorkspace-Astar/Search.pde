import java.util.LinkedList;
import java.util.Collections;
import java.util.HashSet;
import java.util.PriorityQueue;

import java.util.Queue;
/**
 * TODO
 * 
 * Perform a graph search to determine whether the target configuration space
 * point is reachable from the the start. You should not consider configuration 
 * points that are not valid (given the current obstacles--see is_valid_robot_arm(Point).
 * 
 * The potential neighbors of a Point can be generated using the sampleAbove(Point),
 * sampleBelow(Point), sampleRight(Point), and sampleLeft(Point) methods.
 *
 * Your code should return a HashMap<Point, Point> representing the parent tree
 * of your search IF SUCCESSFUL. 
 *
 * If no path exists between the start and the target, this method must return null
 * for the rest of the code to work properly. 
 */
HashMap<Point, Point> search(Point start, Point target) {
  
    // A star Search, Heuristic is distance to target
    HashSet<Point> visited = new HashSet<>();
    HashMap<Point, Point> map = new HashMap<>();
    PriorityQueue<Point> pq = new PriorityQueue();
    //Queue<Point> pq = new LinkedList<>();
    pq.add(start.setTarget(target));
    
    while (pq.size() > 0){
       Point pos = pq.poll();
     
       if (pos.equals(target)){
         return map;
       }
       if (!visited.contains(pos)){
         visited.add(pos);
         for (Point p: pos.getNeighbors()){
           if (!visited.contains(p)){
             map.put(p, pos);
             pq.add(p);
           }
         }
       }
    }

    return null;
}

/**
 * Given the tree structure returned by search, return the path from the 
 * source (which is the root of the tree), to the target as an ArrayList that
 * begins with the source and ends with the target. 
 */
ArrayList<Point> extractPath(HashMap<Point, Point> tree, Point target) {
  ArrayList<Point> path = new ArrayList<>();
  LinkedList<Point> stack = new LinkedList<>();
  stack.add(target);
  Point curr;
 do {
   curr = stack.pop();
   if (curr != null){
     path.add(0, curr);
     stack.push(tree.get(curr));
   }
 }
 while(curr != null);
  
  
  return path;
}
