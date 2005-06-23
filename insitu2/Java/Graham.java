public class Graham {

    public boolean run() {
	Point[] points = new Point[10];
	for(int i=0; i < points.length; i++) {
	    points[i] = new Point(i, (int)(Math.random() * 30.0));
	}

	printPoints(points);

	int h = runGrahamsScan(points);
	System.out.println("Hull vertices: " + h);
	printPoints(points);

	System.out.println();
	revertGrahamsScan(points,h-1);
	printPoints(points);

	boolean check = true;
	for(int i=1; i < points.length; i++) {
	    check = check && (points[i].x > points[i-1].x);
	}

	return check;
	
    }

    private void swap(Point[] points, int i, int j) {
	System.out.println( points[i] + " <-> " + points[j]);
	Point p = points[i];
	points[i] = points[j];
	points[j] = p;
    }

    private boolean rightTurn(Point[] points, int i, int j, int k) {
	System.out.println("Rightturn: " + points[i] + " " + points[j] + " " + points[k]);
	return (((points[i].x * points[j].y) +
		 (points[j].x * points[k].y) +
		 (points[k].x * points[i].y) -
		 (points[i].x * points[k].y) -
		 (points[j].x * points[i].y) -
		 (points[k].x * points[j].y)) <= 0);
    }

    private int runGrahamsScan(Point[] points) {
	int h = 0;
	for (int i = 0; i < points.length; i++) {
	    System.out.println("Push("+points[i]+")");
	    while ((h >= 2) && (!rightTurn(points, h-2, h-1, i))) {
		h =  h - 1;
		System.out.println("Pop("+points[h]+")");
	    };
	    swap(points,i,h);
	    printStack(points,h);
	    h =  h + 1;
	}

	return h;
    }

    private void revertGrahamsScan(Point[] points, int h) {
	int q = points.length - 1;
	while( h != q ) {
	    System.out.println(h+" "+q);
	    if (points[h].x > points[q].x) {
		swap(points,h,q);
		printPoints(points);
		q = q - 1;
		if (points[h-1].x > points[h].x) {
		    h = h - 1;
		}
		while ((points[h].x < points[h+1].x) &&
		    rightTurn(points,h-1,h,h+1)) {
		    h = h + 1;
		}
	    }
	    else {
		h = h + 1;
	    }
	}
	System.out.println();
    }

    private void printPoints(Point[] points) {
	for(int i=0; i < points.length; i++) {
	    System.out.print(points[i] + " ");
	}
	System.out.println();
    }

    private void printStack(Point[] points, int h) {
	System.out.print("Stack: ");
	for(int i=0; i <= h; i++) {
	    System.out.print(points[i] + " ");
	}
	System.out.println();
	System.out.println();
    }

    public static void main(String[] args) {
	Graham g = new Graham();
	while (g.run()) {};
    }
}
