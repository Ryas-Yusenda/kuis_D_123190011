import 'package:flutter/material.dart';
import 'app_store.dart';
import 'detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Center(
            child: Text("App Store"),
          ),
          backgroundColor: const Color.fromRGBO(1, 135, 95, 1)),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: _createListCard(),
      ),
    );
  }

  Widget _createListCard() {
    var menu = appStoreList();

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: menu.length,
      itemBuilder: (BuildContext context, int index) {
        return _createCard(menu[index], context);
      },
    );
  }

  Widget _createCard(AppStore data, BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return DetailPage(
              name: data.name,
              imageLogo: data.imageLogo,
              developer: data.developer,
              genre: data.genre,
              rating: data.rating,
              description: data.description,
              appLink: data.appLink,
              imageUrls: data.imageUrls,
            );
          }));
        },
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Image.network(
                data.imageLogo,
                fit: BoxFit.fitWidth,
                height: 400,
                width: 250,
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: Text(
                    data.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  )),
            ),
            Expanded(
              flex: 2,
              child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                  child: Text(
                    data.description,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  )),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.fromLTRB(130, 30, 0, 0),
                child: Text(
                  data.rating,
                  style: const TextStyle(
                    fontSize: 10,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
