public class Selection {

    public boolean run() {
	Point[] points = new Point[10];

	for(int i=0; i < points.length; i++) {
	    points[i] = new Point(i, (int)(Math.random() * 10.0));
	}

/*
	points[0] = new Point(0,0); 
	points[1] = new Point(1,6);
	points[2] = new Point(2,4);
	points[3] = new Point(3,8);
	points[4] = new Point(4,3);
	points[5] = new Point(5,9);
	points[6] = new Point(6,1);
	points[7] = new Point(7,8);
	points[8] = new Point(8,5);
	points[9] = new Point(9,8);
*/
	printPoints(points);

	int h = sortedSubsetSelection(points);
	System.out.println("Index returned: " + h);
	printPoints(points);

	System.out.println();
	revertSortedSubsetSelection(points,h);
	printPoints(points);

	boolean check = true;
	for(int i=1; i < points.length; i++) {
	    check = check && (points[i].x > points[i-1].x);
	}

	System.out.println();
	System.out.println("-------------------------------------------------------------");
	System.out.println();

	return check;
    }

    private void swap(Point[] points, int i, int j) {
	System.out.println( points[i] + " <-> " + points[j]);
	Point p = points[i];
	points[i] = points[j];
	points[j] = p;
    }

    private int sortedSubsetSelection(Point[] points) {
	int j = 0;
	int m = 0;
	int i = 0;
	while (i < points.length) {
	    while ((i < points.length) && 
		   (points[i].x > points[i].y)) {
		i = i+1;
	    }
	    j = i+1;
	    while ((j < points.length) && 
		   (points[j].y >= points[j].x)) {
		j = j+1;
	    }
	    if (j < points.length) {
		swap(points,i,j);
		m = i+1;
	    }
	    else {
		i = points.length;
	    }
	}

	return m;
    }

    private void revertSortedSubsetSelection(Point[] points, int m) {
	int i = m-1;
	int j = points.length - 1;
	while ((i != j) && (i >= 0)) {
	    if (points[j].x < points[i].x) {
		swap(points, i, j);
		i = i - 1;
	    }
	    j = j - 1;
	} 
    }

    private void printPoints(Point[] points) {
	for(int i=0; i < points.length; i++) {
	    System.out.print(points[i] + " ");
	}
	System.out.println();
    }

    public static void main(String[] args) {
	Selection s = new Selection();
	while (s.run()) {};
    }
}
