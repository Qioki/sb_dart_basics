// Реализуйте класс Point, который описывает точку в трёхмерном пространстве. У данного класса реализуйте метод distanceTo(Point another), который возвращает расстояние от данной точки до точки в параметре.
// По желанию можете реализовать метод, принимающий три точки в трёхмерном пространстве и возвращающий площадь треугольника, который образуют данные точки.
// Реализуйте factory-конструкторы для данного класса, возвращающие начало координат, и ещё несколько на своё усмотрение (например, конструктор, возвращающий точку с координатами [1,1,1], которая определяет единичный вектор).
import 'dart:math';

class Point {
  double x = 0;
  double y = 0;
  double z = 0;

  Point(this.x, this.y, this.z);

  factory Point.zero() {
    return Point(0, 0, 0);
  }

  factory Point.normal(double x, double y, double z) {
    var p = Point(x, y, z);
    p.normalize();
    return p;
  }

  double distanceTo(Point another) {
    return sqrt(
        pow(another.x - x, 2) + pow(another.y - y, 2) + pow(another.z - z, 2));
  }

  void normalize() {
    var d = distanceTo(Point.zero());
    x /= d;
    y /= d;
    z /= d;
  }

  Point operator -(Point p) {
    return Point(x - p.x, y - p.y, z - p.z);
  }

  static double triangleArea(Point A, Point B, Point C) {
    return vectorProduct(B - A, C - A).distanceTo(Point.zero()).abs() /
        2; // S =   1/2 |a × b|
  }

  static Point vectorProduct(Point v1, Point v2) {
    return Point(v1.y * v2.z - v1.z * v2.y, v2.x * v1.z - v1.x * v2.z,
        v1.x * v2.y - v1.y * v2.x);
  }

  @override
  String toString() {
    return 'x = $x; y = $y; z = $z;';
  }
}
