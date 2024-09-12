part of 'pages.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double listItemWidth =
        MediaQuery.of(context).size.width - 2 * defaultMargin;

    return ListView(
      children: [
        //   Header
        Container(
          color: Colors.white,
          height: 100,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Food Market",
                    style: blackFontStyle1,
                  ),
                  Text(
                    "Let's Go Eat!",
                    style: blackFontStyle2,
                  ),
                ],
              ),
              Container(
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://i.pinimg.com/564x/35/66/fb/3566fb6a1401703c145e9662bc3a7958.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
        //   Card Food
        Container(
          height: 220,
          width: double.infinity,
          margin: EdgeInsets.symmetric(
            vertical: defaultMargin,
          ),
          child: ListView(
              scrollDirection: Axis.horizontal,
              children: mockFoods
                  .map(
                    (food) => Padding(
                      padding: EdgeInsets.only(
                          left: (food == mockFoods.first) ? defaultMargin : 0,
                          right: defaultMargin),
                      child: FoodCard(
                        food: food,
                      ),
                    ),
                  )
                  .toList()),
        ),
        //   Tab Layout
        Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomTabbar(
                titles: [
                  'New Taste',
                  'Popular',
                  'Recomended',
                ],
                selectedIndex: selectedIndex,
                onTap: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              Builder(
                builder: (_) {
                  List<Food> foods = (selectedIndex == 0)
                      ? mockFoods
                      : (selectedIndex == 1)
                          ? []
                          : [];
                  return Column(
                    children: foods
                        .map((e) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FoodListItem(
                                food: e,
                                itemWidth: listItemWidth,
                              ),
                            ))
                        .toList(),
                  );
                },
              ),
              SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
