import 'package:flutter/material.dart';
import 'package:get/get.dart';

T sl<T>() => Get.find<T>();
permanentPut<T>(T dependency) => Get.put<T>(dependency, permanent: true);
GlobalKey<NavigatorState> navigatorKeyGlobal = GlobalKey();
String baseUrl = 'https://api.themoviedb.org/3/movie/';
String apiKey = '78cd61a53524aa34a4c173cf4f103972';
String imageBaseURl = 'https://image.tmdb.org/t/p/original';
bool snackBarIsShown = false;
String youtubeAddress = 'https://www.youtube.com/watch?v=';
