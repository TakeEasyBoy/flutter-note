// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';

Future<Map<String,String>> printDailyNewsDigest() {
  final future = gatherNewsReports();
  return future;
}
var words = <num> [1,2,3];
main() {
  printDailyNewsDigest()
    .then((value) {
      print('hahah');
      print(value);
      print(words);
    });
  printWinningLotteryNumbers();
  printWeatherForecast();
  printBaseballScore();
}

printWinningLotteryNumbers() {
  print('Winning lotto numbers: [23, 63, 87, 26, 2]');
}

printWeatherForecast() {
  print("Tomorrow's forecast: 70F, sunny.");
  print(words);
}

printBaseballScore() {
  words.insertAll(0,[4,5]);
  print('Baseball score: Red Sox 10, Yankees 0');
}

const news = '<gathered news goes here>';
const oneSecond = Duration(seconds: 1);

// Imagine that this function is more complex and slow. :)
Future<Map<String,String>> gatherNewsReports() =>
    Future.delayed(oneSecond, () {
        return {'data':'asfasd'};
});

// Alternatively, you can get news from a server using features
// from either dart:io or dart:html. For example:
//
// import 'dart:html';
//
// Future<String> gatherNewsReportsFromServer() => HttpRequest.getString(
//      'https://www.dartlang.org/f/dailyNewsDigest.txt',
//    );
