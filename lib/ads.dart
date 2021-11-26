import 'package:flutter/cupertino.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

Widget Ads() {
  BannerAd bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: 'ca-app-pub-3940256099942544/6300978111',
      //'ca-app-pub-1186173356477991/5705987821',
      listener: BannerAdListener(onAdLoaded: (Ad ad) {
        print('ad loaded');
      }, onAdFailedToLoad: (Ad ad, LoadAdError error) {
        print('ad Faild');
        ad.dispose();
      }, onAdOpened: (Ad ad) {
        print('ad Opend');
      }),
      request: AdRequest());
  return Container(
    child: AdWidget(
      ad: bannerAd..load(),
      key: UniqueKey(),
    ),
    height: 50,
  );
}
