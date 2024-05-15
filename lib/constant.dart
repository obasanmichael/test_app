
class CarouselItem {
  final String image1;
  final String image2;
  final String image3;
  final String title;
  final String subtext;

  CarouselItem(
      {required this.image1,
      required this.image2,
      required this.image3,
      required this.subtext,
      required this.title});
}

final List<CarouselItem> carouselItems = [
  CarouselItem(
      image1: 'assets/images/bank-now.png',
      image2: 'assets/images/bank-now-icon.png',
      image3: 'assets/images/bank-now-review.png',
      subtext:
          'Open a US bank account in minutes even if you are still at the airport.',
      title: 'Bank Now, Not Later'),
  CarouselItem(
      image1: 'assets/images/build-credit.png',
      image2: 'assets/images/build-credit-icon.png',
      image3: 'assets/images/build-credit-review.png',
      subtext:
          'Open a US bank account in minutes even if you are still at the airport.',
      title: 'Build Credit'),
  CarouselItem(
      image1: 'assets/images/get-paid.png',
      image2: 'assets/images/get-paid-icon.png',
      image3: 'assets/images/get-paid-review.png',
      subtext:
          'Open a US bank account in minutes even if you are still at the airport.',
      title: 'Get Paid'),
];
