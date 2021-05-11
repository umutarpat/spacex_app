import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test1_app/Home/home_controller.dart';
import 'package:test1_app/global/models/spacex_latest_model.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder<SpacexLatest>(
            future: controller.getLatestData(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.active:
                case ConnectionState.waiting:
                  return Container();

                case ConnectionState.done:
                  return Container(
                    margin: EdgeInsets.only(top: 50),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text("Name: ${snapshot.data.name}"),
                        SizedBox(
                          height: 30,
                        ),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text("Details:")),
                        SizedBox(
                          height: 10,
                        ),
                        Text("${snapshot.data.details}"),
                        Image.network(snapshot.data.links.patch.large)
                      ],
                    ),
                  );
                  break;
                default:
                  return Container();
                  break;
              }
            }),
      ),
    );
  }
}
