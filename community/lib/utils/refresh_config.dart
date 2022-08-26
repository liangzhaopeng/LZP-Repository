import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

var normalHeader = ClassicalHeader(
    refreshText: 'Pull down refresh',
    refreshReadyText: 'Release start',
    refreshingText: 'Refreshing...',
    refreshedText: 'Refresh complete',
    infoText: 'Last refresh on %T',
    infoColor: Colors.grey
);

var normalFooter = ClassicalFooter(
    loadText: 'Pull up loading',
    loadReadyText: 'Release start',
    loadingText: 'Loading...',
    loadedText: 'Load complete',
    noMoreText: "It's over",
    infoText: 'Last load on %T',
    infoColor: Colors.grey
);