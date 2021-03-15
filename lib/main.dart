import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _page = 0;

  PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: _page);
    super.initState();
  }

  switchScreen(newPage) => setState(() => this._page = newPage);

  @override
  Widget build(BuildContext context) {
    /* Bottom Navigation */
    renderBottomNavigationItems() => <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.wifi_tethering),
            label: 'Sida 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Sida två',
          ),
        ];

    renderBottomNavigation() => BottomNavigationBar(
          onTap: (index) => this._pageController.jumpToPage(index),
          type: BottomNavigationBarType.fixed,
          items: renderBottomNavigationItems(),
        );

    Widget deviceFrame = DeviceFrame(
      device: Devices.ios.iPhone11,
      isFrameVisible: true,
      orientation: Orientation.portrait,
      screen: Scaffold(
        appBar: AppBar(
          title: Text('Frobics'),
        ),
        body: PageView(
          controller: _pageController,
          onPageChanged: (newPage) => switchScreen(newPage),
          children: [
            ScreenOne(),
            ScreenTwo(),
          ],
        ),
        bottomNavigationBar: renderBottomNavigation(),
      ),
    );

    Widget leftSideWelcomeText = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Flowbic',
          style: TextStyle(fontSize: 40),
        ),
        Text(
          'Vi super bra, du supernöjd',
          style: TextStyle(fontSize: 30),
        ),
      ],
    );

    renderHeroSection() => Container(
          color: Color(0xffa000),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth < 1000) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    leftSideWelcomeText,
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: deviceFrame,
                    ),
                  ],
                );
              }

              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  leftSideWelcomeText,
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.75,
                    child: deviceFrame,
                  ),
                ],
              );
            },
          ),
        );

    renderAboutTeamSection() => Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth < 1000) {
                return Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.red,
                      padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'THE TEAM',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 25),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Tillit, lyhördhet och ett starkt gemensamt intresse är det som definierar Flowbic. Det har gett oss kunskapen om varandras styrkor och svagheter. Vi vet vem som kan mest om problemet vi har framför oss. Stark gruppdynamik och nära kommunikation gör att vi kan växa tillsammans för varje individuell prestation.',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        'lib/assets/images/team.jpeg',
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                );
              }

              return Row(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width * 0.5,
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'THE TEAM',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 30),
                        ),
                        Text(
                          'Tillit, lyhördhet och ett starkt gemensamt intresse är det som definierar Flowbic. Det har gett oss kunskapen om varandras styrkor och svagheter. Vi vet vem som kan mest om problemet vi har framför oss. Stark gruppdynamik och nära kommunikation gör att vi kan växa tillsammans för varje individuell prestation.',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width * 0.5,
                    padding: EdgeInsets.all(50),
                    child: Image.asset('lib/assets/images/team.jpeg'),
                  )
                ],
              );
            },
          ),
        );

    aboutMeSection() => Container(
          height: MediaQuery.of(context).size.height,
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth < 1000) {
                return Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Om mig',
                            style: TextStyle(fontSize: 30),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem',
                            style: TextStyle(
                                fontSize: 20, wordSpacing: 1, height: 1.8),
                          ),
                          SizedBox(height: 40),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.4,
                            child: DeviceFrame(
                              device: Devices.ios.iPhone11,
                              isFrameVisible: true,
                              orientation: Orientation.portrait,
                              screen: Container(
                                color: Colors.blue,
                                child: Center(child: Text('Hello')),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                );
              }

              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width * 0.5,
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Om oss',
                          style: TextStyle(fontSize: 40),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem',
                          style: TextStyle(
                            fontSize: 20,
                            wordSpacing: 1,
                            height: 1.8,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: DeviceFrame(
                      device: Devices.ios.iPhone11,
                      isFrameVisible: true,
                      orientation: Orientation.portrait,
                      screen: Container(
                        color: Colors.blue,
                        child: Center(child: Text('Hello')),
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        );

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            renderHeroSection(),
            aboutMeSection(),
            renderAboutTeamSection(),
          ],
        ),
      ),
    );
  }
}

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      padding: EdgeInsets.all(50),
      children: [
        Image.asset(
          'lib/assets/images/edaierlogo.png',
          height: 200,
        ),
        const SizedBox(height: 40),
        Image.asset(
          'lib/assets/images/OhCleo_logo.png',
          height: 200,
        ),
        const SizedBox(height: 40),
        Image.asset('lib/assets/images/giddslogo.png', height: 100),
      ],
    ));
  }
}

class ScreenOne extends StatelessWidget {
  const ScreenOne({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('lib/assets/images/flowbiclogo.png'),
          const SizedBox(height: 20),
          Text(
            'Webb & Mobilutvecklare :P',
            style: TextStyle(color: Colors.white, fontSize: 20),
          )
        ],
      ),
    );
  }
}
