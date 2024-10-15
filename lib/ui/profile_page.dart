part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int selectedIndex = 0;

  void refresh() {
    context
        .read<UserCubit>()
        .getUser((context.read<UserCubit>().state as UserLoaded).user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Gambar
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Container(
                width: 150,
                height: 150,
                margin: const EdgeInsets.only(
                  top: 26.0,
                ),
                padding: const EdgeInsets.all(
                  10.0,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage((context.read<UserCubit>().state
                                    as UserLoaded)
                                .user
                                .picturePath ??
                            'https://ui-avatars.com/api/?name=${(context.read<UserCubit>().state as UserLoaded).user.name}'),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
            // User Name
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: defaultMargin,
              ),
              child: Column(
                children: [
                  Text(
                    (context.read<UserCubit>().state as UserLoaded).user.name ??
                        '',
                    style: blackFontStyle1,
                  ),
                  Text(
                    (context.read<UserCubit>().state as UserLoaded)
                            .user
                            .email ??
                        '',
                    style: blackFontStyle2.copyWith(color: greyColor),
                  ),
                ],
              ),
            ),
            // Jarak Putih
            Container(
              color: Colors.white,
              height: 45,
              width: double.infinity,
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.symmetric(horizontal: 20),
            ),
            // CustomTabBar
            Container(
              padding: const EdgeInsets.fromLTRB(
                defaultMargin,
                defaultMargin,
                defaultMargin,
                0,
              ),
              child: Column(
                children: [
                  CustomTabbar(
                    selectedIndex: selectedIndex,
                    titles: const [
                      'Account',
                      'FoodMarker',
                    ],
                    onTap: (index) {
                      setState(
                        () {
                          selectedIndex = index;
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  (selectedIndex == 0)
                      ? Container(
                          child: Column(
                            children: [
                              Container(
                                child: GestureDetector(
                                  onTap: () {
                                    Get.to(() => EditProfilePage())!
                                        .then((value) => refresh());
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Edit Profile',
                                        style: blackFontStyle2,
                                      ),
                                      SizedBox(
                                        width: 40,
                                        child: Image.asset(
                                          'assets/right_arrow.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Home Address',
                                      style: blackFontStyle2,
                                    ),
                                    SizedBox(
                                      width: 40,
                                      child: Image.asset(
                                        'assets/right_arrow.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Security',
                                      style: blackFontStyle2,
                                    ),
                                    SizedBox(
                                      width: 40,
                                      child: Image.asset(
                                        'assets/right_arrow.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Payment',
                                      style: blackFontStyle2,
                                    ),
                                    SizedBox(
                                      width: 40,
                                      child: Image.asset(
                                        'assets/right_arrow.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        context.read<UserCubit>().signOut();
                                        Get.to(SignInPage());
                                      },
                                      child: Text(
                                        'Sign Out',
                                        style: blackFontStyle2,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 40,
                                      child: Image.asset(
                                        'assets/right_arrow.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
