import 'package:sb_dart_basics/basics.dart';
import 'package:sb_dart_basics/delimiters.dart';
import 'package:sb_dart_basics/point.dart';
import 'package:sb_dart_basics/user.dart';

void main() {
  print('NOD = ${Delimiters.nod(33, 24)}');
  print('NOD Evkild = ${Delimiters.nodEvklid(33, 24)}');
  print('NOK = ${Delimiters.nok(33, 24)}');
  print('NOK Evkild = ${Delimiters.nokEvklid(33, 24)}');
  print('Delimiters = ${Delimiters.getDelimiters(33)}');

  print('toBinaryString: ${Basics.toBinaryString(85)}');
  print('toDecimal: ${Basics.toDecimal('1010101')}');
  print('findNums: ${Basics.findNums('one 2 hello 34.22 asda,sdad 777')}');
  print(
      'findMatches: ${Basics.findMatches('str one 2 hello str str 2 hello'.split(' '))}');
  print(
      'findNumbers: ${Basics.findNumbers('three str one 2 two str str 2 hello nine')}');

  print('distanceTo ${Point(-1, 1, 1).distanceTo(Point(1, 1, 1))}');
  print(
      'findTriangleArea ${Point.triangleArea(Point(0, 0, 0), Point(1, 0, 0), Point(1, 1, 0))}');
  print('normalize ${Point.normal(2, 0, 0)}');
  print('num sqrt ${3.root(2)}');

  var u = AdminUser('ff@rr');
  print('email ${u.getMailSystem()}');
  var manager = UserManager();
  manager.add(AdminUser('sd@admi'));
  manager.add(GeneralUser('sd@gen'));
  manager.add(u);
  manager.remove(u);
  print('email list ${manager.getEmails()}');

  print('integral = ${integral((x) => x, 0, 1, 0.01)}');
}

double tst(double x) => -x;
