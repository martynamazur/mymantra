import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mymantra/config/AppStrings.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              appBar(context),

              SizedBox(height: 32),

              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                crossAxisSpacing: 24,
                mainAxisSpacing: 24,
                children: [
                  GridItem(
                    iconPath: 'assets/images/folder.png',
                    label: AppStrings.mycards,
                    routeWidget: '/MyCards',
                  ),
                  GridItem(
                    iconPath: 'assets/images/theme.png',
                    label: AppStrings.theme,
                    routeWidget: '/ThemeApp',
                  ),
                  GridItem(
                    iconPath: 'assets/images/cloud.png',
                    label: AppStrings.cloudSynchronization,
                    routeWidget: '/CloudSynchronization',
                  ),
                  GridItem(
                    iconPath: 'assets/images/ring.png',
                    label: AppStrings.reminders,
                    routeWidget: '/Reminders',
                  ),
                  GridItem(
                    iconPath: 'assets/images/settings.png',
                    label: AppStrings.settings,
                    routeWidget: '/Settings',
                  ),
                  GridItem(
                    iconPath: 'assets/images/phone.png',
                    label: AppStrings.aboutApp,
                    routeWidget: '/AboutAppScreen',
                  ),
                ],
              ),

              SizedBox(height: 20),

              Text(
                AppStrings.rateAppQuestion,
                style: TextStyle(
                    fontSize: 18,
                    letterSpacing: 0.10,
                    fontWeight: FontWeight.w300),
              ),

              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClayContainer(
                    borderRadius: 10,
                    width: 65,
                    height: 60,
                    child: IconButton(
                      alignment: Alignment.bottomCenter,
                      onPressed: () {},
                      icon: Image.asset('assets/images/thumbs_up.png'),
                    ),
                  ),
                  SizedBox(width: 20),
                  ClayContainer(
                    borderRadius: 10,
                    width: 65,
                    height: 60,
                    child: IconButton(
                      onPressed: () {},
                      alignment: Alignment.bottomCenter,
                      icon: Image.asset('assets/images/thumbs_down.png'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget appBar(BuildContext context){
  return Row(
    children: [
      Expanded(
        child: Text(
          AppStrings.appName,
          style: TextStyle(
            letterSpacing: 0.10,
            fontWeight: FontWeight.w300,
            fontSize: 46,
          ),
        ),
      ),
      IconButton(
        onPressed: (){
          Navigator.of(context).pop();
        },
        icon: Icon(Icons.close_rounded),
      ),
    ],
  );
}


class GridItem extends StatelessWidget {
  final String iconPath;
  final String label;
  final String routeWidget;

  const GridItem({
    required this.iconPath,
    required this.label,
    required this.routeWidget,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, routeWidget);
      },
      child: ClayContainer(
        depth: 10,
        spread: 5,
        borderRadius: 5,
        color: Color(0xFFF0F0F3),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              iconPath,
              // Zmieniamy rozmiar ikony
            ),
            SizedBox(height: 10),
            Text(label, style: TextStyle(fontSize: 16, color: Color(0xFF6E808D)
                , fontWeight: FontWeight.w400)),
          ],
        ),
      ),
    );
  }
}
