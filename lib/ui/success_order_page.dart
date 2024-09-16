part of 'pages.dart';

class SuccessOrderPage extends StatelessWidget {
  const SuccessOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return IllustrationPage(
      title: "You've Made Order",
      subtitle: "Your Food is still processing",
      picturePath: 'assets/bike.png',
      buttonTitle1: 'Order Other Food',
      buttonTap1: () {},
      buttonTap2: () {},
      buttonTitle2: 'View My Order',
    );
  }
}
