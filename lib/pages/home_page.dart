import 'package:flutter/material.dart';
import 'package:furniture/models/furniture_model.dart';
import 'package:furniture/services/furniture_service.dart';
import 'package:furniture/services/users_service.dart';

class FurnitureCard extends StatefulWidget {
  final FurnitureModel furnitureItem;

  const FurnitureCard({super.key, required this.furnitureItem});

  @override
  _FurnitureCardState createState() => _FurnitureCardState();
}

class _FurnitureCardState extends State<FurnitureCard> {
  int currentImage = 0;
  bool iconIsSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 186,
      margin: const EdgeInsets.only(right: 20),
      child: Card(
        elevation: 3,
        color: const Color(0xFFF3F0EB),
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              MouseRegion(
                cursor: SystemMouseCursors.click,
                onEnter: (event) {
                  setState(() {
                    currentImage = 1;
                  });
                },
                onExit: (event) {
                  setState(() {
                    currentImage = 0;
                  });
                },
                child: InkWell(
                  hoverColor: Colors.transparent,
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DetailOfCurrentCard(
                          furnitureItem: widget.furnitureItem);
                    }));
                  },
                  child: Container(
                    width: 164,
                    height: 160,
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(7)),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            widget.furnitureItem.image[currentImage]),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 6, bottom: 6),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 2),
                              decoration: const BoxDecoration(
                                color: Color(0xff8c795f),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.star,
                                    size: 12,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    widget.furnitureItem.rating,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.furnitureItem.title,
                      style: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 16),
                    ),
                    Text(
                      widget.furnitureItem.category,
                      style: const TextStyle(
                          color: Color(0xFF858484),
                          fontSize: 13,
                          fontWeight: FontWeight.w600),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$${widget.furnitureItem.price}",
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w800),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add_circle,
                            size: 40,
                            color: Color(0xff8c795f),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8f8f8),
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 16, right: 16),
            // ! without api
            // child: CircleAvatar(
            //   foregroundImage: NetworkImage(
            //       'https://i.pinimg.com/564x/89/85/66/898566079a7410335af0b7d240cb0765.jpg'),
            // ),
            // ! with api
            child: FutureBuilder(
                future: getDataOfUser(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return InkWell(
                      hoverColor: Colors.transparent,
                      onTap: () {},
                      child: CircleAvatar(
                        foregroundImage:
                            NetworkImage(snapshot.data![0].imageProfile),
                      ),
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                }),
          )
        ],
      ),
      drawer: Drawer(
        width: 260,
        shape: const BeveledRectangleBorder(),
        child: Column(
          children: [
            FutureBuilder(
                future: getDataOfUser(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      padding: const EdgeInsets.only(
                        top: 30,
                      ),
                      height: 200,
                      width: double.maxFinite,
                      color: const Color(0xff8c795f),
                      child: Column(
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            margin: const EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromARGB(97, 0, 0, 0),
                                  blurRadius: 30,
                                  spreadRadius: 8,
                                  blurStyle: BlurStyle.solid,
                                )
                              ],
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50)),
                              image: DecorationImage(
                                image: NetworkImage(
                                    snapshot.data![0].imageProfile),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              "${snapshot.data![0].firstName} ${snapshot.data![0].lastName}",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Text(
                            snapshot.data![0].email,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                }),
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 20, right: 16),
              child: Column(
                children: [
                  InkWell(
                    hoverColor: Colors.transparent,
                    onTap: () {},
                    child: returnContainer("Account", Icons.person_2_outlined),
                  ),
                  InkWell(
                    hoverColor: Colors.transparent,
                    onTap: () {},
                    child: returnContainer("Theme", Icons.light_mode_outlined),
                  ),
                  InkWell(
                    hoverColor: Colors.transparent,
                    onTap: () {},
                    child: returnContainer("History", Icons.history_outlined),
                  ),
                  InkWell(
                    hoverColor: Colors.transparent,
                    onTap: () {},
                    child: returnContainer("Language", Icons.language_outlined),
                  ),
                  InkWell(
                    hoverColor: Colors.transparent,
                    onTap: () {},
                    child: returnContainer("Settings", Icons.settings_outlined),
                  ),
                  InkWell(
                    hoverColor: Colors.transparent,
                    onTap: () {},
                    child:
                        returnContainer("About App", Icons.person_2_outlined),
                  ),
                  const Divider(color: Color(0xff574b3b)),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    hoverColor: Colors.transparent,
                    onTap: () {},
                    child: returnContainer(
                        "Invite friend", Icons.person_add_outlined),
                  ),
                  InkWell(
                    hoverColor: Colors.transparent,
                    onTap: () {},
                    child: returnContainer("Logout", Icons.logout),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 26),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 6,
                            blurStyle: BlurStyle.outer,
                            color: Color(0xff8c795f),
                            spreadRadius: 2,
                          )
                        ]),
                    width: 338,
                    margin: const EdgeInsets.only(top: 26, bottom: 20),
                    child: TextFormField(
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              width: 2,
                              color: Color(0xffffffff),
                            )),
                        hintText: "Search for furniture",
                        hintStyle:
                            const TextStyle(fontSize: 14, color: Colors.grey),
                        filled: true,
                        fillColor: Colors.white,
                        hoverColor: Colors.white,
                        focusColor: Colors.white,
                        prefixIcon: const Padding(
                          padding: EdgeInsets.only(left: 16, right: 6),
                          child: Icon(Icons.search, color: Color(0xFF8c795f)),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              width: 2,
                              color: Color(0xffffffff),
                            )),
                        suffixIcon: SizedBox(
                          height: 20,
                          width: 60,
                          child: Row(
                            children: [
                              const VerticalDivider(
                                thickness: 1,
                                indent: 6,
                                endIndent: 6,
                                color: Color(0xFF8c795f),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Image.network(
                                    width: 28,
                                    height: 28,
                                    'https://assets.dummyjson.com/public/qr-code.png'),
                              )
                            ],
                          ),
                        ),
                      ),
                    )),
              ],
            ),
            const Text(
              "Categories",
              style: TextStyle(
                  color: Color(0xff8c795f),
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 18,
            ),
            SizedBox(
              height: 46,
              child: ListView(
                padding: const EdgeInsets.only(bottom: 10),
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: FloatingActionButton.extended(
                      backgroundColor: const Color(0xff8c795f),
                      hoverColor: const Color(0xff8c795f),
                      onPressed: () {},
                      // elevation: 0,
                      // hoverElevation: 0,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      foregroundColor: Colors.white,
                      label: const Text(
                        'Shelf Units',
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: FloatingActionButton.extended(
                      backgroundColor: const Color(0xffffffff),
                      hoverColor: const Color(0xffffffff),
                      onPressed: () {},
                      // elevation: 0,
                      // hoverElevation: 0,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      foregroundColor: const Color(0xff8c795f),
                      label: const Text(
                        'Tables',
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: FloatingActionButton.extended(
                      backgroundColor: const Color(0xffffffff),
                      hoverColor: const Color(0xffffffff),
                      onPressed: () {},
                      // elevation: 0,
                      // hoverElevation: 0,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      foregroundColor: const Color(0xff8c795f),
                      label: const Text(
                        'Sofa',
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: FloatingActionButton.extended(
                      backgroundColor: const Color(0xffffffff),
                      hoverColor: const Color(0xffffffff),
                      onPressed: () {},
                      // elevation: 0,
                      // hoverElevation: 0,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      foregroundColor: const Color(0xff8c795f),
                      label: const Text(
                        'Armchair',
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: FloatingActionButton.extended(
                      backgroundColor: const Color(0xffffffff),
                      hoverColor: const Color(0xffffffff),
                      onPressed: () {},
                      // elevation: 0,
                      // hoverElevation: 0,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      foregroundColor: const Color(0xff8c795f),
                      label: const Text(
                        'Bookcase',
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: FloatingActionButton.extended(
                      backgroundColor: const Color(0xffffffff),
                      hoverColor: const Color(0xffffffff),
                      onPressed: () {},
                      // elevation: 0,
                      // hoverElevation: 0,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      foregroundColor: const Color(0xff8c795f),
                      label: const Text(
                        'Wardrobe',
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SizedBox(
                height: 300,
                width: 400,
                child: FutureBuilder(
                    future: getDataOfFurniture(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          padding: const EdgeInsets.only(top: 10),
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (BuildContext context, index) {
                            return FurnitureCard(
                                furnitureItem: snapshot.data![index]);
                          },
                        );
                      } else {
                        return const CircularProgressIndicator();
                      }
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ! parse color from string to int
Color parseColorToHex(String hexColor) {
  return Color(int.parse("0xff$hexColor"));
}

returnContainer(String text, dynamic icon) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 16),
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                color: Color.fromARGB(131, 158, 158, 158),
                borderRadius: BorderRadius.all(
                  Radius.circular(6),
                ),
              ),
              child: Icon(
                icon,
                color: const Color(0xff8c795f),
              ),
            ),
            Text(
              text,
              style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Color(0xff574b3b)),
            ),
          ],
        ),
      ),
      const Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Icon(Icons.keyboard_arrow_right, color: Color(0xff574b3b)),
      ),
    ],
  );
}

class DetailOfCurrentCard extends StatefulWidget {
  final FurnitureModel furnitureItem;

  const DetailOfCurrentCard({super.key, required this.furnitureItem});

  @override
  State<DetailOfCurrentCard> createState() => _DetailOfCurrentCardState();
}

class _DetailOfCurrentCardState extends State<DetailOfCurrentCard> {
  int currentImage = 1;
  double widthAndHeightQR = 40;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff3f0eb),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            onEnter: (event) {
              setState(() {
                currentImage = 0;
              });
            },
            onExit: (event) {
              setState(() {
                currentImage = 1;
              });
            },
            child: AnimatedContainer(
              width: double.maxFinite,
              height: 460,
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.furnitureItem.image[currentImage]),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        foregroundDecoration: const BoxDecoration(
                            color: Color.fromARGB(31, 0, 0, 0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        decoration: const BoxDecoration(
                            color: Color(0xfff3f0eb),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        child: const Padding(
                          padding: EdgeInsets.only(right: 2),
                          child: Icon(
                            Icons.keyboard_arrow_left,
                            color: Color(0xff8c795f),
                            size: 36,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      onEnter: (event) {
                        setState(() {
                          widthAndHeightQR = 200;
                        });
                      },
                      onExit: (event) {
                        setState(() {
                          widthAndHeightQR = 40;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        width: widthAndHeightQR,
                        height: widthAndHeightQR,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(4)),
                          image: DecorationImage(
                            image: NetworkImage(widget.furnitureItem.qrCode),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.furnitureItem.title,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 2),
                      decoration: const BoxDecoration(
                        color: Color(0xff8c795f),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.star,
                            size: 12,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            widget.furnitureItem.rating,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    widget.furnitureItem.category,
                    style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 14, bottom: 30),
                  child: Text(
                    widget.furnitureItem.description,
                    style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Row(
                  children: [
                    const Text(
                      'Color',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff8c795f)),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 28,
                          height: 28,
                          child: FloatingActionButton(
                            onPressed: () {},
                            backgroundColor:
                                parseColorToHex(widget.furnitureItem.colors[0]),
                          ),
                        ),
                        Container(
                          width: 28,
                          height: 28,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: FloatingActionButton(
                              onPressed: () {},
                              backgroundColor: parseColorToHex(
                                  widget.furnitureItem.colors[1])),
                        ),
                        SizedBox(
                          width: 28,
                          height: 28,
                          child: FloatingActionButton(
                              onPressed: () {},
                              backgroundColor: parseColorToHex(
                                  widget.furnitureItem.colors[2])),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50)),
                        border: Border.all(
                            color: const Color(0xff8c795f), width: 2),
                      ),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite_border,
                            size: 30,
                            color: Color(0xFF3B2300),
                          )),
                    ),
                    SizedBox(
                      width: 240,
                      height: 50,
                      child: FilledButton.icon(
                        onPressed: () {},
                        label: const Text(
                          "Add to Cart",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w600),
                        ),
                        icon: const Icon(Icons.shopping_cart_outlined),
                        style: FilledButton.styleFrom(
                            backgroundColor: const Color(0xff8c795f)),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),

          // Text(
          //   "\$${widget.furnitureItem.price}",
          //   style: const TextStyle(fontSize: 20),
          // ),
        ],
      ),
    );
  }
}
