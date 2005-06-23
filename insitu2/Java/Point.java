public class Point {
    Point(int x, int y) {
	this.x = x;
	this.y = y;
    }

    public String toString() {
	return "(" + this.x + "," + this.y + ")";
    }

    public int x;
    public int y;
}
