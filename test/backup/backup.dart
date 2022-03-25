import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


final List<String> hexList = [
  'assets/complex.png',
  'assets/simple.png',
  'assets/breath.png',
  'assets/silence.png',
];


final List<String> hexlinesList = [
  'assets/complexup.png',
  'assets/complexdown.png',
  'assets/simpleup.png',
  'assets/simpledown.png',
  'assets/breathup.png',
  'assets/breathdown.png',
  'assets/silenceup.png',
  'assets/silencedown.png',
];

final List<String> hexfullList = [
  'assets/complexwhite.png',
  'assets/complexup.png',
  'assets/complexdown.png',
  'assets/complexblack.png',
  'assets/simplewhite.png',
  'assets/simpleup.png',
  'assets/simpledown.png',
  'assets/simpleblack.png',
  'assets/breathwhite.png',
  'assets/breathup.png',
  'assets/breathdown.png',
  'assets/breathblack.png',
  'assets/silencewhite.png',
  'assets/silenceup.png',
  'assets/silencedown.png',
  'assets/silenceblack.png',
];

void main() => runApp(const CarouselDemo());

final themeMode = ValueNotifier(2);

class CarouselDemo extends StatelessWidget {
  const CarouselDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (context, value, g) {
        return MaterialApp(
          initialRoute: '/',
          darkTheme: ThemeData.dark(),
          themeMode: ThemeMode.values.toList()[value as int],
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (ctx) => CarouselDemoHome(),
            // '/gfgslider': (ctx) => GFGSlider(),
            // '/basic': (ctx) => BasicDemo(),
            // '/nocenter': (ctx) => NoCenterDemo(),
            // '/image': (ctx) => ImageSliderDemo(),
            //  '/complicated': (ctx) => ComplicatedImageDemo(),
            //'/enlarge': (ctx) => EnlargeStrategyDemo(),
            // '/manual': (ctx) => ManuallyControlledSlider(),
            // '/noloop': (ctx) => NoonLoopingDemo(),
            //'/vertical': (ctx) => VerticalSliderDemo(),
            //'/fullscreen': (ctx) => FullscreenSliderDemo(),
            //'/ondemand': (ctx) => OnDemandCarouselDemo(),
            '/indicator': (ctx) => RotateHexagramLayers(),
            // '/prefetch': (ctx) => PrefetchImageDemo(),
            // '/reason': (ctx) => CarouselChangeReasonDemo(),
            //'/position': (ctx) => KeepPageviewPositionDemo(),
            '/multiple': (ctx) => MultipleItemDemo(),
            //'/dragem': (ctx) => Dragem(),
          },
        );
      },
      valueListenable: themeMode,
    );
  }
}

class DemoItem extends StatelessWidget {
  final String title;
  final String route;
  const DemoItem(this.title, this.route);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 30.0,
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, route);
      },
    );
  }
}

class CarouselDemoHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Time for iChange'),
        actions: [
          IconButton(
              icon: const Icon(Icons.nightlight_round),
              onPressed: () {
                themeMode.value = themeMode.value == 1 ? 2 : 1;
              })
        ],
      ),
      body: ListView(
        children: const <Widget>[
          //DemoItem('Basic demo', '/basic'),
          //DemoItem('GFG Slider', '/gfgslider'),
          // DemoItem('No center mode demo', '/nocenter'),
          // DemoItem('Image carousel slider', '/image'),
          // DemoItem('More complicated image slider', '/complicated'),
          //DemoItem('Enlarge strategy demo slider', '/enlarge'),
          //DemoItem('Manually controlled slider', '/manual'),
          // DemoItem('Noon-looping carousel slider', '/noloop'),
          //DemoItem('Vertical carousel slider', '/vertical'),
          //DemoItem('Fullscreen carousel slider', '/fullscreen'),
          DemoItem('Rotate Hexagrams', '/indicator'),
          // DemoItem('On-demand carousel slider', '/ondemand'),
          // DemoItem('Image carousel slider with prefetch demo', '/prefetch'),
          // DemoItem('Carousel change reason demo', '/reason'),
          //DemoItem('Keep pageview position demo', '/position'),
          DemoItem('All Items', '/multiple'),
          //DemoItem('Drag Em', '/dragem')
        ],
      ),
    );
  }
}

class BasicDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<int> list = [1, 2, 3, 4];
    return Scaffold(
      appBar: AppBar(title: const Text('Basic demo')),
      body: Container(
          child: CarouselSlider(
            options: CarouselOptions(),
            items: list
                .map((item) => Container(
              child: Center(child: Text(item.toString())),
              color: Colors.green,
            ))
                .toList(),
          )),
    );
  }
}

class NoCenterDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<int> list = [1, 2, 3, 4, 5];
    return Scaffold(
      appBar: AppBar(title: const Text('Basic demo')),
      body: Container(
          child: CarouselSlider(
            options: CarouselOptions(
              disableCenter: true,
            ),
            items: list
                .map((item) => Container(
              child: Text(item.toString()),
              color: Colors.green,
            ))
                .toList(),
          )),
    );
  }
}

class ImageSliderDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image slider demo')),
      body: Container(
          child: CarouselSlider(
            options: CarouselOptions(),
            items: hexList
                .map((item) => Container(
              child: Center(
                  child: Image.asset(item, fit: BoxFit.cover, width: 200)),
            ))
                .toList(),
          )),
    );
  }
}

final List<Widget> imageSliders = hexList
    .map((item) => Container(
  child: Container(
    margin: const EdgeInsets.all(5.0),
    child: ClipRRect(
        borderRadius: const BorderRadius.all(const Radius.circular(5.0)),
        child: Stack(
          children: <Widget>[
            Image.asset(item, fit: BoxFit.cover, width: 500.0),
            // Positioned(
            // bottom: 0.0,
            // left: 0.0,
            // right: 0.0,
            // child: Container(
            // decoration: BoxDecoration(
            // gradient: LinearGradient(
            //  colors: [
            //  Color.fromARGB(200, 0, 0, 0),
            //   Color.fromARGB(0, 0, 0, 0)
            //  ],
            //  begin: Alignment.bottomCenter,
            //    end: Alignment.topCenter,
            //   ),
            // ),
            // padding: EdgeInsets.symmetric(
            //    vertical: 10.0, horizontal: 20.0),
            // child: Text(
            //  '${hexList.indexOf(item)}',
            // style: TextStyle(
            //  color: Colors.white,
            // fontSize: 10.0,
            //   fontWeight: FontWeight.bold,
            //   ),
            //   ),
            // ),
            //),
          ],
        )),
  ),
))
    .toList();

class ComplicatedImageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Complicated image slider demo')),
      body: Container(
        child: CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 2.0,
            enlargeCenterPage: true,
          ),
          items: imageSliders,
        ),
      ),
    );
  }
}

class EnlargeStrategyDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Complicated image slider demo')),
      body: Container(
        child: CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 2.0,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
          ),
          items: imageSliders,
        ),
      ),
    );
  }
}

class ManuallyControlledSlider extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ManuallyControlledSliderState();
  }
}

class _ManuallyControlledSliderState extends State<ManuallyControlledSlider> {
  final CarouselController _controller = CarouselController();
  final CarouselController _controllertop = CarouselController();
  final CarouselController _controllermid = CarouselController();
  final CarouselController _controllerbot = CarouselController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Manually controlled slider')),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              CarouselSlider(
                items: imageSliders,
                options: CarouselOptions(enlargeCenterPage: true, height: 100),
                carouselController: _controllertop,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    child: ElevatedButton(
                      onPressed: () => _controllertop.previousPage(),
                      child: const Text('←'),
                    ),
                  ),
                  Flexible(
                    child: ElevatedButton(
                      onPressed: () => _controllertop.nextPage(),
                      child: const Text('→'),
                    ),
                  ),
                  ...Iterable<int>.generate(hexList.length).map(
                        (int pageIndex) => Flexible(
                      child: ElevatedButton(
                        onPressed: () =>
                            _controllertop.animateToPage(pageIndex),
                        child: Text("$pageIndex"),
                      ),
                    ),
                  ),
                ],
              ),
              CarouselSlider(
                items: imageSliders,
                options: CarouselOptions(enlargeCenterPage: true, height: 100),
                carouselController: _controllermid,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    child: ElevatedButton(
                      onPressed: () => _controllermid.previousPage(),
                      child: const Text('←'),
                    ),
                  ),
                  Flexible(
                    child: ElevatedButton(
                      onPressed: () => _controllermid.nextPage(),
                      child: const Text('→'),
                    ),
                  ),
                  ...Iterable<int>.generate(hexList.length).map(
                        (int pageIndex) => Flexible(
                      child: ElevatedButton(
                        onPressed: () =>
                            _controllermid.animateToPage(pageIndex),
                        child: Text("$pageIndex"),
                      ),
                    ),
                  ),
                ],
              ),
              CarouselSlider(
                items: imageSliders,
                options: CarouselOptions(enlargeCenterPage: true, height: 100),
                carouselController: _controllerbot,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    child: ElevatedButton(
                      onPressed: () => _controllerbot.previousPage(),
                      child: const Text('←'),
                    ),
                  ),
                  Flexible(
                    child: ElevatedButton(
                      onPressed: () => _controllerbot.nextPage(),
                      child: const Text('→'),
                    ),
                  ),
                  ...Iterable<int>.generate(hexList.length).map(
                        (int pageIndex) => Flexible(
                      child: ElevatedButton(
                        onPressed: () =>
                            _controllerbot.animateToPage(pageIndex),
                        child: Text("$pageIndex"),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

class NoonLoopingDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Noon-looping carousel demo')),
      body: Container(
          child: CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 2.0,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              initialPage: 2,
              autoPlay: true,
            ),
            items: imageSliders,
          )),
    );
  }
}

class VerticalSliderDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Vertical sliding carousel demo')),
      body: Container(
        alignment: Alignment.center,
        width: 150,
        height: 150,
        child: CarouselSlider(
          options: CarouselOptions(
            //yaniv
            //viewportFraction: 1,
            aspectRatio: 0.8,
            enlargeCenterPage: true,
            scrollDirection: Axis.vertical,
            autoPlay: false,
          ),
          items: imageSliders,
        ),),
    );
  }
}

class FullscreenSliderDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fullscreen sliding carousel demo')),
      body: Builder(
        builder: (context) {
          final double height = MediaQuery.of(context).size.height;
          return CarouselSlider(
            options: CarouselOptions(
              height: height,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              // autoPlay: false,
            ),
            items: hexList
                .map((item) => Container(
              child: Center(
                  child: Image.asset(
                    item,
                    fit: BoxFit.cover,
                    height: height,
                  )),
            ))
                .toList(),
          );
        },
      ),
    );
  }
}

class OnDemandCarouselDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('On-demand carousel demo')),
      body: Container(
          child: CarouselSlider.builder(
            itemCount: 100,
            options: CarouselOptions(
              aspectRatio: 2.0,
              enlargeCenterPage: true,
              autoPlay: true,
            ),
            itemBuilder: (ctx, index, realIdx) {
              return Container(
                child: Text(index.toString()),
              );
            },
          )),
    );
  }
}

class PrefetchImageDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PrefetchImageDemoState();
  }
}

class _PrefetchImageDemoState extends State<PrefetchImageDemo> {
  //final List<String> images = [
  //'https://images.unsplash.com/photo-1586882829491-b81178aa622e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
  //'https://images.unsplash.com/photo-1586871608370-4adee64d1794?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2862&q=80',
  //'https://images.unsplash.com/photo-1586901533048-0e856dff2c0d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
  //'https://images.unsplash.com/photo-1586902279476-3244d8d18285?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
  //'https://images.unsplash.com/photo-1586943101559-4cdcf86a6f87?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1556&q=80',
  //'https://images.unsplash.com/photo-1586951144438-26d4e072b891?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
  //'https://images.unsplash.com/photo-1586953983027-d7508a64f4bb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
  //];
  final List<String> images = [
    'assets/yangyang.png',
    'assets/yinyang.png',
    'assets/yangyin.png',
    'assets/yinyin.png',
  ];

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      images.forEach((imageUrl) {
        precacheImage(AssetImage(imageUrl), context);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Prefetch image slider demo')),
      body: Container(
          child: CarouselSlider.builder(
            itemCount: images.length,
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 2.0,
              enlargeCenterPage: true,
            ),
            itemBuilder: (context, index, realIdx) {
              return Container(
                child: Center(
                    child:
                    Image.asset(images[index], fit: BoxFit.cover, width: 1000)),
              );
            },
          )),
    );
  }
}

class CarouselChangeReasonDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CarouselChangeReasonDemoState();
  }
}

class _CarouselChangeReasonDemoState extends State<CarouselChangeReasonDemo> {
  String reason = '';
  final CarouselController _controller = CarouselController();

  void onPageChange(int index, CarouselPageChangedReason changeReason) {
    setState(() {
      reason = changeReason.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Change reason demo')),
        body: Column(
          children: <Widget>[
            Expanded(
              child: CarouselSlider(
                items: imageSliders,
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  onPageChanged: onPageChange,
                  autoPlay: true,
                ),
                carouselController: _controller,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child: ElevatedButton(
                    onPressed: () => _controller.previousPage(),
                    child: const Text('←'),
                  ),
                ),
                Flexible(
                  child: ElevatedButton(
                    onPressed: () => _controller.nextPage(),
                    child: const Text('→'),
                  ),
                ),
                ...Iterable<int>.generate(hexList.length).map(
                      (int pageIndex) => Flexible(
                    child: ElevatedButton(
                      onPressed: () => _controller.animateToPage(pageIndex),
                      child: Text("$pageIndex"),
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: Column(
                children: [
                  const Text('page change reason: '),
                  Text(reason),
                ],
              ),
            )
          ],
        ));
  }
}

class KeepPageviewPositionDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Keep pageview position demo')),
      body: ListView.builder(itemBuilder: (ctx, index) {
        if (index == 4) {
          return Container(
              child: CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                  pageViewKey: const PageStorageKey<String>('carousel_slider'),
                ),
                items: imageSliders,
              ));
        } else {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            color: Colors.blue,
            height: 200,
            child: const Center(
              child: Text('other content'),
            ),
          );
        }
      }),
    );
  }
}

class MultipleItemDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('All Items')),
      body: Container(
          child: CarouselSlider.builder(
            options: CarouselOptions(
              aspectRatio: 2.0,
              enlargeCenterPage: false,
              viewportFraction: 1,
            ),
            //itemCount: (hexList.length / 2).round(),
            itemCount: hexfullList.length,
            itemBuilder: (context, index, realIdx) {
              //final int first = index * 2;
              //final int second = first + 1;
              return Row(
                //children:   [first, second].map((idx) {
                children:   hexfullList.asMap().entries.map((idx) {
                  return Expanded(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Image.asset(hexfullList[idx.key], fit: BoxFit.cover),
                    ),
                  );
                }).toList(),
              );
            },
          )),
    );
  }
}

class GFGSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GFG Slider"),
      ),
      body: ListView(
        children: [
          CarouselSlider(
            items: [
              //1st Image of Slider
              Container(
                margin: const EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: const DecorationImage(
                    image: AssetImage("assets/yangyang.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //2nd Image of Slider
              Container(
                margin: const EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: const DecorationImage(
                    image: AssetImage("assets/yangyang.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //3rd Image of Slider
              Container(
                margin: const EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: const DecorationImage(
                    image: AssetImage("assets/yangyang.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //4th Image of Slider
              Container(
                margin: const EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: const DecorationImage(
                    image: const AssetImage("assets/yangyang.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //5th Image of Slider
              Container(
                margin: const EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: const DecorationImage(
                    image: const AssetImage("assets/yangyang.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],

            //Slider Container properties
            options: CarouselOptions(
              height: 180.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
          ),
        ],
      ),
    );
  }
}

class Dragem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Dragem();
  }
}

class _Dragem extends State<Dragem> {
  double width = 100.0, height = 100.0;
  late Offset position ;

  @override
  void initState() {
    super.initState();
    position = Offset(0.0, height - 20);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: position.dx,
          //top: position.dy - height + 20,
          child: Draggable(
            child: Container(
              width: width,
              height: height,
              color: Colors.blue,
              child: Center(child: Text("Complex", style: Theme.of(context).textTheme.bodyText1,),),
            ),
            feedback: Container(
              child: Center(
                child: Text("Complex", style: Theme.of(context).textTheme.bodyText1,),),
              color: Colors.blue[800],
              width: width,
              height: height,
            ),
            onDraggableCanceled: (Velocity velocity, Offset offset){
              setState(() => position = offset);
            },
          ),
        ),
        Positioned(
          bottom: position.dx,
          //top: position.dy - height + 20,
          child: Draggable(
            child: Container(
              width: width,
              height: height,
              color: Colors.red,
              child: Center(child: Text("Silence", style: Theme.of(context).textTheme.bodyText1,),),
            ),
            feedback: Container(
              child: Center(
                child: Text("Silence", style: Theme.of(context).textTheme.bodyText1,),),
              color: Colors.red[800],
              width: width,
              height: height,
            ),
            onDraggableCanceled: (Velocity velocity, Offset offset){
              setState(() => position = offset);
            },
          ),
        ),
        Positioned(
          left: position.dx,
          //top: position.dy - height + 20,
          child: Draggable(
            child: Container(
              width: width,
              height: height,
              color: Colors.green,
              child: Center(child: Text("Simple", style: Theme.of(context).textTheme.bodyText1,),),
            ),
            feedback: Container(
              child: Center(
                child: Text("Simple", style: Theme.of(context).textTheme.bodyText1,),),
              color: Colors.green[800],
              width: width,
              height: height,
            ),
            onDraggableCanceled: (Velocity velocity, Offset offset){
              setState(() => position = offset);
            },
          ),
        ),
        Positioned(
          right: position.dx,
          //top: position.dy - height + 20,
          child: Draggable(
            child: Container(
              width: width,
              height: height,
              color: Colors.yellow,
              child: Center(child: Text("Breath", style: Theme.of(context).textTheme.bodyText1,),),
            ),
            feedback: Container(
              child: Center(
                child: Text("Breath", style: Theme.of(context).textTheme.bodyText1,),),
              color: Colors.yellow[800],
              width: width,
              height: height,
            ),
            onDraggableCanceled: (Velocity velocity, Offset offset){
              setState(() => position = offset);
            },
          ),
        ),
      ],
    );
  }
}

// idonotknow

class RotateHexagramLayers extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RotateHexagramLayersState();
  }
}

class _RotateHexagramLayersState extends State<RotateHexagramLayers> {
  //int _current = 0;
  int _currenttop = 0;
  int _currentmid = 0;
  int _currentbot = 0;
  int hexagramVal = 0;
  int chosenHex = 0;
  final CarouselController _controller = CarouselController();
  final CarouselController _controllertop = CarouselController();
  final CarouselController _controllermid = CarouselController();
  final CarouselController _controllerbot = CarouselController();
  final TextEditingController _txt = TextEditingController();
  final TextEditingController _txt1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rotate Hexagrams')),
      body: Column(children: [
        TextField(
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
          controller: _txt1,
          readOnly: false,
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          onChanged: (chosenHex) {
            switch (chosenHex) {
            //Quarter of Mutation
              case '1':
                _controllertop.animateToPage(0);
                _controllermid.animateToPage(0);
                _controllerbot.animateToPage(0);
                break;
              case '43':
                _controllertop.animateToPage(1);
                _controllermid.animateToPage(0);
                _controllerbot.animateToPage(0);
                break;
              case '14':
                _controllertop.animateToPage(2);
                _controllermid.animateToPage(0);
                _controllerbot.animateToPage(0);
                break;
              case '34':
                _controllertop.animateToPage(3);
                _controllermid.animateToPage(0);
                _controllerbot.animateToPage(0);
                break;
              case '9':
                _controllertop.animateToPage(0);
                _controllermid.animateToPage(1);
                _controllerbot.animateToPage(0);
                break;
              case '5':
                _controllertop.animateToPage(1);
                _controllermid.animateToPage(1);
                _controllerbot.animateToPage(0);
                break;
              case '26':
                _controllertop.animateToPage(2);
                _controllermid.animateToPage(1);
                _controllerbot.animateToPage(0);
                break;
              case '11':
                _controllertop.animateToPage(3);
                _controllermid.animateToPage(1);
                _controllerbot.animateToPage(0);
                break;
              case '10':
                _controllertop.animateToPage(0);
                _controllermid.animateToPage(2);
                _controllerbot.animateToPage(0);
                break;
              case '58':
                _controllertop.animateToPage(1);
                _controllermid.animateToPage(2);
                _controllerbot.animateToPage(0);
                break;
              case '38':
                _controllertop.animateToPage(2);
                _controllermid.animateToPage(2);
                _controllerbot.animateToPage(0);
                break;
              case '54':
                _controllertop.animateToPage(3);
                _controllermid.animateToPage(2);
                _controllerbot.animateToPage(0);
                break;
              case '61':
                _controllertop.animateToPage(0);
                _controllermid.animateToPage(3);
                _controllerbot.animateToPage(0);
                break;
              case '60':
                _controllertop.animateToPage(1);
                _controllermid.animateToPage(3);
                _controllerbot.animateToPage(0);
                break;
              case '41':
                _controllertop.animateToPage(2);
                _controllermid.animateToPage(3);
                _controllerbot.animateToPage(0);
                break;
              case '19':
                _controllertop.animateToPage(3);
                _controllermid.animateToPage(3);
                _controllerbot.animateToPage(0);
                break;

            //Quarter of Initiation
              case '13':
                _controllertop.animateToPage(0);
                _controllermid.animateToPage(0);
                _controllerbot.animateToPage(1);
                break;
              case '49':
                _controllertop.animateToPage(1);
                _controllermid.animateToPage(0);
                _controllerbot.animateToPage(1);
                break;
              case '30':
                _controllertop.animateToPage(2);
                _controllermid.animateToPage(0);
                _controllerbot.animateToPage(1);
                break;
              case '55':
                _controllertop.animateToPage(3);
                _controllermid.animateToPage(0);
                _controllerbot.animateToPage(1);
                break;
              case '37':
                _controllertop.animateToPage(0);
                _controllermid.animateToPage(1);
                _controllerbot.animateToPage(1);
                break;
              case '63':
                _controllertop.animateToPage(1);
                _controllermid.animateToPage(1);
                _controllerbot.animateToPage(1);
                break;
              case '22':
                _controllertop.animateToPage(2);
                _controllermid.animateToPage(1);
                _controllerbot.animateToPage(1);
                break;
              case '36':
                _controllertop.animateToPage(3);
                _controllermid.animateToPage(1);
                _controllerbot.animateToPage(1);
                break;
              case '25':
                _controllertop.animateToPage(0);
                _controllermid.animateToPage(2);
                _controllerbot.animateToPage(1);
                break;
              case '17':
                _controllertop.animateToPage(1);
                _controllermid.animateToPage(2);
                _controllerbot.animateToPage(1);
                break;
              case '21':
                _controllertop.animateToPage(2);
                _controllermid.animateToPage(2);
                _controllerbot.animateToPage(1);
                break;
              case '51':
                _controllertop.animateToPage(3);
                _controllermid.animateToPage(2);
                _controllerbot.animateToPage(1);
                break;
              case '42':
                _controllertop.animateToPage(0);
                _controllermid.animateToPage(3);
                _controllerbot.animateToPage(1);
                break;
              case '3':
                _controllertop.animateToPage(1);
                _controllermid.animateToPage(3);
                _controllerbot.animateToPage(1);
                break;
              case '27':
                _controllertop.animateToPage(2);
                _controllermid.animateToPage(3);
                _controllerbot.animateToPage(1);
                break;
              case '24':
                _controllertop.animateToPage(3);
                _controllermid.animateToPage(3);
                _controllerbot.animateToPage(1);
                break;

            //Quarter of Duality
              case '44':
                _controllertop.animateToPage(0);
                _controllermid.animateToPage(0);
                _controllerbot.animateToPage(2);
                break;
              case '28':
                _controllertop.animateToPage(1);
                _controllermid.animateToPage(0);
                _controllerbot.animateToPage(2);
                break;
              case '50':
                _controllertop.animateToPage(2);
                _controllermid.animateToPage(0);
                _controllerbot.animateToPage(2);
                break;
              case '32':
                _controllertop.animateToPage(3);
                _controllermid.animateToPage(0);
                _controllerbot.animateToPage(2);
                break;
              case '57':
                _controllertop.animateToPage(0);
                _controllermid.animateToPage(1);
                _controllerbot.animateToPage(2);
                break;
              case '48':
                _controllertop.animateToPage(1);
                _controllermid.animateToPage(1);
                _controllerbot.animateToPage(2);
                break;
              case '18':
                _controllertop.animateToPage(2);
                _controllermid.animateToPage(1);
                _controllerbot.animateToPage(2);
                break;
              case '46':
                _controllertop.animateToPage(3);
                _controllermid.animateToPage(1);
                _controllerbot.animateToPage(2);
                break;
              case '6':
                _controllertop.animateToPage(0);
                _controllermid.animateToPage(2);
                _controllerbot.animateToPage(2);
                break;
              case '47':
                _controllertop.animateToPage(1);
                _controllermid.animateToPage(2);
                _controllerbot.animateToPage(2);
                break;
              case '64':
                _controllertop.animateToPage(2);
                _controllermid.animateToPage(2);
                _controllerbot.animateToPage(2);
                break;
              case '40':
                _controllertop.animateToPage(3);
                _controllermid.animateToPage(2);
                _controllerbot.animateToPage(2);
                break;
              case '59':
                _controllertop.animateToPage(0);
                _controllermid.animateToPage(3);
                _controllerbot.animateToPage(2);
                break;
              case '29':
                _controllertop.animateToPage(1);
                _controllermid.animateToPage(3);
                _controllerbot.animateToPage(2);
                break;
              case '4':
                _controllertop.animateToPage(2);
                _controllermid.animateToPage(3);
                _controllerbot.animateToPage(2);
                break;
              case '7':
                _controllertop.animateToPage(3);
                _controllermid.animateToPage(3);
                _controllerbot.animateToPage(2);
                break;

            //Quarter of Civilization
              case '33':
                _controllertop.animateToPage(0);
                _controllermid.animateToPage(0);
                _controllerbot.animateToPage(3);
                break;
              case '31':
                _controllertop.animateToPage(1);
                _controllermid.animateToPage(0);
                _controllerbot.animateToPage(3);
                break;
              case '56':
                _controllertop.animateToPage(2);
                _controllermid.animateToPage(0);
                _controllerbot.animateToPage(3);
                break;
              case '62':
                _controllertop.animateToPage(3);
                _controllermid.animateToPage(0);
                _controllerbot.animateToPage(3);
                break;
              case '53':
                _controllertop.animateToPage(0);
                _controllermid.animateToPage(1);
                _controllerbot.animateToPage(3);
                break;
              case '39':
                _controllertop.animateToPage(1);
                _controllermid.animateToPage(1);
                _controllerbot.animateToPage(3);
                break;
              case '52':
                _controllertop.animateToPage(2);
                _controllermid.animateToPage(1);
                _controllerbot.animateToPage(3);
                break;
              case '15':
                _controllertop.animateToPage(3);
                _controllermid.animateToPage(1);
                _controllerbot.animateToPage(3);
                break;
              case '12':
                _controllertop.animateToPage(0);
                _controllermid.animateToPage(2);
                _controllerbot.animateToPage(3);
                break;
              case '45':
                _controllertop.animateToPage(1);
                _controllermid.animateToPage(2);
                _controllerbot.animateToPage(3);
                break;
              case '35':
                _controllertop.animateToPage(2);
                _controllermid.animateToPage(2);
                _controllerbot.animateToPage(3);
                break;
              case '16':
                _controllertop.animateToPage(3);
                _controllermid.animateToPage(2);
                _controllerbot.animateToPage(3);
                break;
              case '20':
                _controllertop.animateToPage(0);
                _controllermid.animateToPage(3);
                _controllerbot.animateToPage(3);
                break;
              case '8':
                _controllertop.animateToPage(1);
                _controllermid.animateToPage(3);
                _controllerbot.animateToPage(3);
                break;
              case '23':
                _controllertop.animateToPage(2);
                _controllermid.animateToPage(3);
                _controllerbot.animateToPage(3);
                break;
              case '2':
                _controllertop.animateToPage(3);
                _controllermid.animateToPage(3);
                _controllerbot.animateToPage(3);
                break;
              default:
                _controllertop.animateToPage(0);
                _controllermid.animateToPage(0);
                _controllerbot.animateToPage(0);
                break;




            }
          },
        ),
        TextField(
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
          controller: _txt,
          readOnly: false,
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
        ),
        Expanded(
          child: CarouselSlider(
            items: imageSliders,
            carouselController: _controllertop,
            options: CarouselOptions(
                autoPlay: false,
                enlargeCenterPage: true,
                aspectRatio: 1.3,
                onPageChanged: (indextop, reason) {
                  setState(() {
                    _currenttop = indextop;
                    hexagramVal = ((_currenttop + 1) * 100 +
                        (_currentmid + 1) * 10 +
                        (_currentbot + 1));
                    switch (hexagramVal) {
                    //Quarter of Mutation
                      case 111:
                        _txt.text = '1';
                        break;
                      case 211:
                        _txt.text = '43';
                        break;
                      case 311:
                        _txt.text = '14';
                        break;
                      case 411:
                        _txt.text = '34';
                        break;
                      case 121:
                        _txt.text = '9';
                        break;
                      case 221:
                        _txt.text = '5';
                        break;
                      case 321:
                        _txt.text = '26';
                        break;
                      case 421:
                        _txt.text = '11';
                        break;
                      case 131:
                        _txt.text = '10';
                        break;
                      case 231:
                        _txt.text = '58';
                        break;
                      case 331:
                        _txt.text = '38';
                        break;
                      case 431:
                        _txt.text = '54';
                        break;
                      case 141:
                        _txt.text = '61';
                        break;
                      case 241:
                        _txt.text = '60';
                        break;
                      case 341:
                        _txt.text = '41';
                        break;
                      case 441:
                        _txt.text = '19';
                        break;
                    //Quarter of Initiation
                      case 112:
                        _txt.text = '13';
                        break;
                      case 212:
                        _txt.text = '49';
                        break;
                      case 312:
                        _txt.text = '30';
                        break;
                      case 412:
                        _txt.text = '55';
                        break;
                      case 122:
                        _txt.text = '37';
                        break;
                      case 222:
                        _txt.text = '63';
                        break;
                      case 322:
                        _txt.text = '22';
                        break;
                      case 422:
                        _txt.text = '36';
                        break;
                      case 132:
                        _txt.text = '25';
                        break;
                      case 232:
                        _txt.text = '17';
                        break;
                      case 332:
                        _txt.text = '21';
                        break;
                      case 432:
                        _txt.text = '51';
                        break;
                      case 142:
                        _txt.text = '42';
                        break;
                      case 242:
                        _txt.text = '3';
                        break;
                      case 342:
                        _txt.text = '27';
                        break;
                      case 442:
                        _txt.text = '24';
                        break;

                    //Quarter of Duality
                      case 113:
                        _txt.text = '44';
                        break;
                      case 213:
                        _txt.text = '28';
                        break;
                      case 313:
                        _txt.text = '50';
                        break;
                      case 413:
                        _txt.text = '32';
                        break;
                      case 123:
                        _txt.text = '57';
                        break;
                      case 223:
                        _txt.text = '48';
                        break;
                      case 323:
                        _txt.text = '18';
                        break;
                      case 423:
                        _txt.text = '46';
                        break;
                      case 133:
                        _txt.text = '6';
                        break;
                      case 233:
                        _txt.text = '47';
                        break;
                      case 333:
                        _txt.text = '64';
                        break;
                      case 433:
                        _txt.text = '40';
                        break;
                      case 143:
                        _txt.text = '59';
                        break;
                      case 243:
                        _txt.text = '29';
                        break;
                      case 343:
                        _txt.text = '4';
                        break;
                      case 443:
                        _txt.text = '7';
                        break;
                    //Quarter of Civilization
                      case 114:
                        _txt.text = '33';
                        break;
                      case 214:
                        _txt.text = '31';
                        break;
                      case 314:
                        _txt.text = '56';
                        break;
                      case 414:
                        _txt.text = '62';
                        break;
                      case 124:
                        _txt.text = '53';
                        break;
                      case 224:
                        _txt.text = '39';
                        break;
                      case 324:
                        _txt.text = '52';
                        break;
                      case 424:
                        _txt.text = '15';
                        break;
                      case 134:
                        _txt.text = '12';
                        break;
                      case 234:
                        _txt.text = '45';
                        break;
                      case 334:
                        _txt.text = '35';
                        break;
                      case 434:
                        _txt.text = '16';
                        break;
                      case 144:
                        _txt.text = '20';
                        break;
                      case 244:
                        _txt.text = '8';
                        break;
                      case 344:
                        _txt.text = '23';
                        break;
                      case 444:
                        _txt.text = '2';
                        break;
                    }
                  });
                }),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: hexList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controllertop.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black)
                        .withOpacity(_currenttop == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
        Expanded(
          child: CarouselSlider(
            items: imageSliders,
            carouselController: _controllermid,
            options: CarouselOptions(
                autoPlay: false,
                enlargeCenterPage: true,
                aspectRatio: 1.3,
                onPageChanged: (indexmid, reason) {
                  setState(() {
                    _currentmid = indexmid;

                    hexagramVal = ((_currenttop + 1) * 100 +
                        (_currentmid + 1) * 10 +
                        (_currentbot + 1));
                    switch (hexagramVal) {
                    //Quarter of Mutation
                      case 111:
                        _txt.text = '1';
                        break;
                      case 211:
                        _txt.text = '43';
                        break;
                      case 311:
                        _txt.text = '14';
                        break;
                      case 411:
                        _txt.text = '34';
                        break;
                      case 121:
                        _txt.text = '9';
                        break;
                      case 221:
                        _txt.text = '5';
                        break;
                      case 321:
                        _txt.text = '26';
                        break;
                      case 421:
                        _txt.text = '11';
                        break;
                      case 131:
                        _txt.text = '10';
                        break;
                      case 231:
                        _txt.text = '58';
                        break;
                      case 331:
                        _txt.text = '38';
                        break;
                      case 431:
                        _txt.text = '54';
                        break;
                      case 141:
                        _txt.text = '61';
                        break;
                      case 241:
                        _txt.text = '60';
                        break;
                      case 341:
                        _txt.text = '41';
                        break;
                      case 441:
                        _txt.text = '19';
                        break;
                    //Quarter of Initiation
                      case 112:
                        _txt.text = '13';
                        break;
                      case 212:
                        _txt.text = '49';
                        break;
                      case 312:
                        _txt.text = '30';
                        break;
                      case 412:
                        _txt.text = '55';
                        break;
                      case 122:
                        _txt.text = '37';
                        break;
                      case 222:
                        _txt.text = '63';
                        break;
                      case 322:
                        _txt.text = '22';
                        break;
                      case 422:
                        _txt.text = '36';
                        break;
                      case 132:
                        _txt.text = '25';
                        break;
                      case 232:
                        _txt.text = '17';
                        break;
                      case 332:
                        _txt.text = '21';
                        break;
                      case 432:
                        _txt.text = '51';
                        break;
                      case 142:
                        _txt.text = '42';
                        break;
                      case 242:
                        _txt.text = '3';
                        break;
                      case 342:
                        _txt.text = '27';
                        break;
                      case 442:
                        _txt.text = '24';
                        break;

                    //Quarter of Duality
                      case 113:
                        _txt.text = '44';
                        break;
                      case 213:
                        _txt.text = '28';
                        break;
                      case 313:
                        _txt.text = '50';
                        break;
                      case 413:
                        _txt.text = '32';
                        break;
                      case 123:
                        _txt.text = '57';
                        break;
                      case 223:
                        _txt.text = '48';
                        break;
                      case 323:
                        _txt.text = '18';
                        break;
                      case 423:
                        _txt.text = '46';
                        break;
                      case 133:
                        _txt.text = '6';
                        break;
                      case 233:
                        _txt.text = '47';
                        break;
                      case 333:
                        _txt.text = '64';
                        break;
                      case 433:
                        _txt.text = '40';
                        break;
                      case 143:
                        _txt.text = '59';
                        break;
                      case 243:
                        _txt.text = '29';
                        break;
                      case 343:
                        _txt.text = '4';
                        break;
                      case 443:
                        _txt.text = '7';
                        break;
                    //Quarter of Civilization
                      case 114:
                        _txt.text = '33';
                        break;
                      case 214:
                        _txt.text = '31';
                        break;
                      case 314:
                        _txt.text = '56';
                        break;
                      case 414:
                        _txt.text = '62';
                        break;
                      case 124:
                        _txt.text = '53';
                        break;
                      case 224:
                        _txt.text = '39';
                        break;
                      case 324:
                        _txt.text = '52';
                        break;
                      case 424:
                        _txt.text = '15';
                        break;
                      case 134:
                        _txt.text = '12';
                        break;
                      case 234:
                        _txt.text = '45';
                        break;
                      case 334:
                        _txt.text = '35';
                        break;
                      case 434:
                        _txt.text = '16';
                        break;
                      case 144:
                        _txt.text = '20';
                        break;
                      case 244:
                        _txt.text = '8';
                        break;
                      case 344:
                        _txt.text = '23';
                        break;
                      case 444:
                        _txt.text = '2';
                        break;
                    }
                  });
                }),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: hexList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controllermid.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black)
                        .withOpacity(_currentmid == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
        Expanded(
          child: CarouselSlider(
            items: imageSliders,
            carouselController: _controllerbot,
            options: CarouselOptions(
                autoPlay: false,
                enlargeCenterPage: true,
                aspectRatio: 1.3,
                onPageChanged: (indexbot, reason) {
                  setState(() {
                    _currentbot = indexbot;
                    hexagramVal = ((_currenttop + 1) * 100 +
                        (_currentmid + 1) * 10 +
                        (_currentbot + 1));
                    switch (hexagramVal) {
                    //Quarter of Mutation
                      case 111:
                        _txt.text = '1';
                        break;
                      case 211:
                        _txt.text = '43';
                        break;
                      case 311:
                        _txt.text = '14';
                        break;
                      case 411:
                        _txt.text = '34';
                        break;
                      case 121:
                        _txt.text = '9';
                        break;
                      case 221:
                        _txt.text = '5';
                        break;
                      case 321:
                        _txt.text = '26';
                        break;
                      case 421:
                        _txt.text = '11';
                        break;
                      case 131:
                        _txt.text = '10';
                        break;
                      case 231:
                        _txt.text = '58';
                        break;
                      case 331:
                        _txt.text = '38';
                        break;
                      case 431:
                        _txt.text = '54';
                        break;
                      case 141:
                        _txt.text = '61';
                        break;
                      case 241:
                        _txt.text = '60';
                        break;
                      case 341:
                        _txt.text = '41';
                        break;
                      case 441:
                        _txt.text = '19';
                        break;
                    //Quarter of Initiation
                      case 112:
                        _txt.text = '13';
                        break;
                      case 212:
                        _txt.text = '49';
                        break;
                      case 312:
                        _txt.text = '30';
                        break;
                      case 412:
                        _txt.text = '55';
                        break;
                      case 122:
                        _txt.text = '37';
                        break;
                      case 222:
                        _txt.text = '63';
                        break;
                      case 322:
                        _txt.text = '22';
                        break;
                      case 422:
                        _txt.text = '36';
                        break;
                      case 132:
                        _txt.text = '25';
                        break;
                      case 232:
                        _txt.text = '17';
                        break;
                      case 332:
                        _txt.text = '21';
                        break;
                      case 432:
                        _txt.text = '51';
                        break;
                      case 142:
                        _txt.text = '42';
                        break;
                      case 242:
                        _txt.text = '3';
                        break;
                      case 342:
                        _txt.text = '27';
                        break;
                      case 442:
                        _txt.text = '24';
                        break;

                    //Quarter of Duality
                      case 113:
                        _txt.text = '44';
                        break;
                      case 213:
                        _txt.text = '28';
                        break;
                      case 313:
                        _txt.text = '50';
                        break;
                      case 413:
                        _txt.text = '32';
                        break;
                      case 123:
                        _txt.text = '57';
                        break;
                      case 223:
                        _txt.text = '48';
                        break;
                      case 323:
                        _txt.text = '18';
                        break;
                      case 423:
                        _txt.text = '46';
                        break;
                      case 133:
                        _txt.text = '6';
                        break;
                      case 233:
                        _txt.text = '47';
                        break;
                      case 333:
                        _txt.text = '64';
                        break;
                      case 433:
                        _txt.text = '40';
                        break;
                      case 143:
                        _txt.text = '59';
                        break;
                      case 243:
                        _txt.text = '29';
                        break;
                      case 343:
                        _txt.text = '4';
                        break;
                      case 443:
                        _txt.text = '7';
                        break;
                    //Quarter of Civilization
                      case 114:
                        _txt.text = '33';
                        break;
                      case 214:
                        _txt.text = '31';
                        break;
                      case 314:
                        _txt.text = '56';
                        break;
                      case 414:
                        _txt.text = '62';
                        break;
                      case 124:
                        _txt.text = '53';
                        break;
                      case 224:
                        _txt.text = '39';
                        break;
                      case 324:
                        _txt.text = '52';
                        break;
                      case 424:
                        _txt.text = '15';
                        break;
                      case 134:
                        _txt.text = '12';
                        break;
                      case 234:
                        _txt.text = '45';
                        break;
                      case 334:
                        _txt.text = '35';
                        break;
                      case 434:
                        _txt.text = '16';
                        break;
                      case 144:
                        _txt.text = '20';
                        break;
                      case 244:
                        _txt.text = '8';
                        break;
                      case 344:
                        _txt.text = '23';
                        break;
                      case 444:
                        _txt.text = '2';
                        break;
                    }
                  });
                }),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: hexList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controllerbot.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black)
                        .withOpacity(_currentbot == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ]),
    );
  }
}