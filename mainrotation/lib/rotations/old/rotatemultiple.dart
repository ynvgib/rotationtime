import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:finallyicanlearn/models/lists.dart';


// rotate multiple hexagarms
class RotateMultipleHexagrams extends StatefulWidget {
  const RotateMultipleHexagrams({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RotateMultipleHexagramsState();
  }
}

class _RotateMultipleHexagramsState extends State<RotateMultipleHexagrams> {
  final CarouselController _controllerlefttop = CarouselController();
  final CarouselController _controllerleftmid = CarouselController();
  final CarouselController _controllerleftbot = CarouselController();

  final CarouselController _controllercenterlefttop = CarouselController();
  final CarouselController _controllercenterleftmid = CarouselController();
  final CarouselController _controllercenterleftbot = CarouselController();

  final CarouselController _controllercenterrighttop = CarouselController();
  final CarouselController _controllercenterrightmid = CarouselController();
  final CarouselController _controllercenterrightbot = CarouselController();

  final CarouselController _controllerrighttop = CarouselController();
  final CarouselController _controllerrightmid = CarouselController();
  final CarouselController _controllerrightbot = CarouselController();

  final TextEditingController _controllertextlefttop = TextEditingController();
  final TextEditingController _controllertextleftbot = TextEditingController();
  final TextEditingController _controllertextcenterlefttop =
  TextEditingController();
  final TextEditingController _controllertextcenterleftbot =
  TextEditingController();
  final TextEditingController _controllertextcenterrighttop =
  TextEditingController();
  final TextEditingController _controllertextcenterrightbot =
  TextEditingController();
  final TextEditingController _controllertextrighttop = TextEditingController();
  final TextEditingController _controllertextrightbot = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rotate Multiple Hexagrams'),
        leading: TextButton(
          child: const Text(
            '<<',
            style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.blueGrey,
        actions: [
          IconButton(
              icon: const Icon(Icons.color_lens),
              onPressed: () {
                _controllerlefttop.jumpToPage(0);
                _controllerleftmid.jumpToPage(0);
                _controllerleftbot.jumpToPage(0);

                _controllercenterlefttop.jumpToPage(5);
                _controllercenterleftmid.jumpToPage(5);
                _controllercenterleftbot.jumpToPage(5);

                _controllercenterrighttop.jumpToPage(10);
                _controllercenterrightmid.jumpToPage(10);
                _controllercenterrightbot.jumpToPage(10);

                _controllerrighttop.jumpToPage(15);
                _controllerrightmid.jumpToPage(15);
                _controllerrightbot.jumpToPage(15);

                _controllertextlefttop.text = "Complex";
                _controllertextleftbot.text = "Mind";
                _controllertextcenterlefttop.text = "Simple";
                _controllertextcenterleftbot.text = "Mind";
                _controllertextcenterrighttop.text = "Breath";
                _controllertextcenterrightbot.text = "Body";
                _controllertextrighttop.text = "Silence";
                _controllertextrightbot.text = "Body";
              }),
          IconButton(
              icon: const Icon(Icons.color_lens_outlined),
              onPressed: () {
                _controllerlefttop.jumpToPage(0);
                _controllerleftmid.jumpToPage(0);
                _controllerleftbot.jumpToPage(0);

                _controllercenterlefttop.jumpToPage(0);
                _controllercenterleftmid.jumpToPage(0);
                _controllercenterleftbot.jumpToPage(0);

                _controllercenterrighttop.jumpToPage(0);
                _controllercenterrightmid.jumpToPage(0);
                _controllercenterrightbot.jumpToPage(0);

                _controllerrighttop.jumpToPage(0);
                _controllerrightmid.jumpToPage(0);
                _controllerrightbot.jumpToPage(0);

                _controllertextlefttop.text = "";
                _controllertextleftbot.text = "";
                _controllertextcenterlefttop.text = "";
                _controllertextcenterleftbot.text = "";
                _controllertextcenterrighttop.text = "";
                _controllertextcenterrightbot.text = "";
                _controllertextrighttop.text = "";
                _controllertextrightbot.text = "";
              }),
          //IconButton(
          // icon: const Icon(Icons.fast_forward),
          // onPressed: () {
          //   _controllerlefttop.nextPage();
          //   _controllerleftmid.nextPage();
          //   _controllerleftbot.nextPage();

          //    _controllercenterlefttop.nextPage();
          //   _controllercenterleftmid.nextPage();
          //   _controllercenterleftbot.nextPage();

          //  _controllercenterrighttop.nextPage();
          //  _controllercenterrightmid.nextPage();
          //   _controllercenterrightbot.nextPage();

          //  _controllerrighttop.nextPage();
          //   _controllerrightmid.nextPage();
          //  _controllerrightbot.nextPage();

          //_controllertextlefttop.text = "";
          //_controllertextleftbot.text = "";
          // _controllertextcenterlefttop.text = "";
          // _controllertextcenterleftbot.text = "";
          // _controllertextcenterrighttop.text = "";
          // _controllertextcenterrightbot.text = "";
          // _controllertextrighttop.text = "";
          // _controllertextrightbot.text = "";

          //}),
        ],
      ),
      backgroundColor: Colors.grey[100],
      body: Row(children: [
        // Left Column
        Flexible(
          flex: 25,
          child: Column(children: [
            TextField(
              decoration: const InputDecoration(
                  hintText: 'You', hintStyle: TextStyle(color: Colors.grey)),
              controller: _controllertextlefttop,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15.0,
                //fontWeight: FontWeight.bold,
              ),
              //controller: _txtleftop,
              readOnly: false,
            ),
            TextField(
              decoration: const InputDecoration(
                  hintText: 'Are', hintStyle: TextStyle(color: Colors.grey)),
              controller: _controllertextleftbot,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15.0,
                //fontWeight: FontWeight.bold,
              ),
              //controller: _txtleftop,
              readOnly: false,
              // keyboardType: TextInputType.number,
            ),
            Expanded(
              child: CarouselSlider(
                //idonotknow 727
                items: allItemsSliders,
                carouselController: _controllerlefttop,
                options: CarouselOptions(
                    autoPlay: false,
                    enlargeCenterPage: true,
                    aspectRatio: 1.3,
                    onPageChanged: (indextopleft, reason) {
                      setState(() {
                        //_currenttopleft = indextopleft;
                      });
                    }),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Flexible(
                  child: IconButton(
                    onPressed: () => _controllerlefttop.previousPage(),
                    icon: const Icon(Icons.arrow_back, color: Colors.blue),
                  ),
                ),
                Flexible(
                  child: IconButton(
                    onPressed: () => _controllerlefttop.nextPage(),
                    icon: const Icon(Icons.arrow_forward, color: Colors.blue),
                  ),
                ),
              ],
            ),
            Expanded(
              child: CarouselSlider(
                items: allItemsSliders,
                carouselController: _controllerleftmid,
                options: CarouselOptions(
                    autoPlay: false,
                    enlargeCenterPage: true,
                    aspectRatio: 1.3,
                    onPageChanged: (indexmidleft, reason) {
                      setState(() {
                        //_currentmidleft = indexmidleft;
                      });
                    }),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Flexible(
                  child: IconButton(
                    onPressed: () => _controllerleftmid.previousPage(),
                    icon: const Icon(Icons.arrow_back, color: Colors.orange),
                  ),
                ),
                Flexible(
                  child: IconButton(
                      onPressed: () => _controllerleftmid.nextPage(),
                      icon: const Icon(Icons.arrow_forward,
                          color: Colors.orange)),
                ),
              ],
            ),
            Expanded(
              child: CarouselSlider(
                items: allItemsSliders,
                carouselController: _controllerleftbot,
                options: CarouselOptions(
                    autoPlay: false,
                    enlargeCenterPage: true,
                    aspectRatio: 1.3,
                    onPageChanged: (indexbotleft, reason) {
                      setState(() {
                        //_currentbotleft = indexbotleft;
                      });
                    }),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Flexible(
                  child: IconButton(
                    onPressed: () => _controllerleftbot.previousPage(),
                    icon: const Icon(Icons.arrow_back, color: Colors.red),
                  ),
                ),
                Flexible(
                  child: IconButton(
                    onPressed: () => _controllerleftbot.nextPage(),
                    icon: const Icon(Icons.arrow_forward, color: Colors.red),
                  ),
                ),
              ],
            ),
          ]),
        ),
        // Center Column
        Flexible(
          flex: 25,
          child: Column(children: [
            TextField(
              decoration: const InputDecoration(
                  hintText: 'A', hintStyle: TextStyle(color: Colors.grey)),
              controller: _controllertextcenterlefttop,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15.0,
                //fontWeight: FontWeight.bold,
              ),
              //controller: _txtleftop,
              readOnly: false,
            ),
            TextField(
              decoration: const InputDecoration(
                  hintText: 'Complex',
                  hintStyle: TextStyle(color: Colors.grey)),
              controller: _controllertextcenterleftbot,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15.0,
                //fontWeight: FontWeight.bold,
              ),
              //controller: _txtleftop,
              readOnly: false,
              // keyboardType: TextInputType.number,
            ),
            Expanded(
              child: CarouselSlider(
                items: allItemsSliders,
                carouselController: _controllercenterlefttop,
                options: CarouselOptions(
                    autoPlay: false,
                    enlargeCenterPage: true,
                    aspectRatio: 1.3,
                    onPageChanged: (indextopcenter, reason) {
                      setState(() {
                        //_currenttopcenter = indextopcenter;
                      });
                    }),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Flexible(
                  child: IconButton(
                    onPressed: () => _controllercenterlefttop.previousPage(),
                    icon: const Icon(Icons.arrow_back, color: Colors.blue),
                  ),
                ),
                Flexible(
                  child: IconButton(
                    onPressed: () => _controllercenterlefttop.nextPage(),
                    icon: const Icon(Icons.arrow_forward, color: Colors.blue),
                  ),
                ),
              ],
            ),
            Expanded(
              child: CarouselSlider(
                items: allItemsSliders,
                carouselController: _controllercenterleftmid,
                options: CarouselOptions(
                    autoPlay: false,
                    enlargeCenterPage: true,
                    aspectRatio: 1.3,
                    onPageChanged: (indexmidcenter, reason) {
                      setState(() {
                        //_currentmidcenter = indexmidcenter;
                      });
                    }),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Flexible(
                  child: IconButton(
                    onPressed: () => _controllercenterleftmid.previousPage(),
                    icon: const Icon(Icons.arrow_back, color: Colors.orange),
                  ),
                ),
                Flexible(
                  child: IconButton(
                    onPressed: () => _controllercenterleftmid.nextPage(),
                    icon: const Icon(Icons.arrow_forward, color: Colors.orange),
                  ),
                ),
              ],
            ),
            Expanded(
              child: CarouselSlider(
                items: allItemsSliders,
                carouselController: _controllercenterleftbot,
                options: CarouselOptions(
                    autoPlay: false,
                    enlargeCenterPage: true,
                    aspectRatio: 1.3,
                    onPageChanged: (indexbotcenter, reason) {
                      setState(() {
                        //_currentbotcenter = indexbotcenter;
                      });
                    }),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Flexible(
                  child: IconButton(
                    onPressed: () => _controllercenterleftbot.previousPage(),
                    icon: const Icon(Icons.arrow_back, color: Colors.red),
                  ),
                ),
                Flexible(
                  child: IconButton(
                    onPressed: () => _controllercenterleftbot.nextPage(),
                    icon: const Icon(Icons.arrow_forward, color: Colors.red),
                  ),
                ),
              ],
            ),
          ]),
        ),
        // Right Column
        Flexible(
          flex: 25,
          child: Column(children: [
            TextField(
              decoration: const InputDecoration(
                  hintText: 'Mesculine',
                  hintStyle: TextStyle(color: Colors.grey)),
              controller: _controllertextcenterrighttop,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15.0,
                //fontWeight: FontWeight.bold,
              ),
              //controller: _txtleftop,
              readOnly: false,
            ),
            TextField(
              decoration: const InputDecoration(
                  hintText: 'Mind', hintStyle: TextStyle(color: Colors.grey)),
              controller: _controllertextcenterrightbot,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15.0,
                //fontWeight: FontWeight.bold,
              ),
              //controller: _txtleftop,
              readOnly: false,
              //keyboardType: TextInputType.number,
            ),
            Expanded(
              child: CarouselSlider(
                items: allItemsSliders,
                carouselController: _controllercenterrighttop,
                options: CarouselOptions(
                    autoPlay: false,
                    enlargeCenterPage: true,
                    aspectRatio: 1.3,
                    onPageChanged: (indextopright, reason) {
                      setState(() {
                        //_currenttopright = indextopright;
                      });
                    }),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Flexible(
                  child: IconButton(
                    onPressed: () => _controllercenterrighttop.previousPage(),
                    icon: const Icon(Icons.arrow_back, color: Colors.blue),
                  ),
                ),
                Flexible(
                  child: IconButton(
                    onPressed: () => _controllercenterrighttop.nextPage(),
                    icon: const Icon(Icons.arrow_forward, color: Colors.blue),
                  ),
                ),
              ],
            ),
            Expanded(
              child: CarouselSlider(
                items: allItemsSliders,
                carouselController: _controllercenterrightmid,
                options: CarouselOptions(
                    autoPlay: false,
                    enlargeCenterPage: true,
                    aspectRatio: 1.3,
                    onPageChanged: (indexmidright, reason) {
                      setState(() {
                        //_currentmidright = indexmidright;
                      });
                    }),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Flexible(
                  child: IconButton(
                    onPressed: () => _controllercenterrightmid.previousPage(),
                    icon: const Icon(Icons.arrow_back, color: Colors.orange),
                  ),
                ),
                Flexible(
                  child: IconButton(
                    onPressed: () => _controllercenterrightmid.nextPage(),
                    icon: const Icon(Icons.arrow_forward, color: Colors.orange),
                  ),
                ),
              ],
            ),
            Expanded(
              child: CarouselSlider(
                items: allItemsSliders,
                carouselController: _controllercenterrightbot,
                options: CarouselOptions(
                    autoPlay: false,
                    enlargeCenterPage: true,
                    aspectRatio: 1.3,
                    onPageChanged: (indexbotright, reason) {
                      setState(() {
                        //_currentbotright = indexbotright;
                      });
                    }),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Flexible(
                  child: IconButton(
                      onPressed: () => _controllercenterrightbot.previousPage(),
                      icon: const Icon(Icons.arrow_back, color: Colors.red)),
                ),
                Flexible(
                  child: IconButton(
                      onPressed: () => _controllercenterrightbot.nextPage(),
                      icon: const Icon(Icons.arrow_forward, color: Colors.red)),
                ),
              ],
            ),
          ]),
        ),
        // Right Column New
        Flexible(
          flex: 25,
          child: Column(children: [
            TextField(
              decoration: const InputDecoration(
                  hintText: 'Mind', hintStyle: TextStyle(color: Colors.grey)),
              controller: _controllertextrighttop,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15.0,
                //fontWeight: FontWeight.bold,
              ),
              //controller: _txtleftop,
              readOnly: false,
              //keyboardType: TextInputType.number,
              //inputFormatters: <TextInputFormatter>[
              //FilteringTextInputFormatter.digitsOnly
              //],
            ),
            TextField(
              decoration: const InputDecoration(
                  hintText: 'Complex',
                  hintStyle: TextStyle(color: Colors.grey)),
              controller: _controllertextrightbot,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15.0,
                //fontWeight: FontWeight.bold,
              ),
              //controller: _txtleftop,
              readOnly: false,
            ),
            Expanded(
              child: CarouselSlider(
                items: allItemsSliders,
                carouselController: _controllerrighttop,
                options: CarouselOptions(
                    autoPlay: false,
                    enlargeCenterPage: true,
                    aspectRatio: 1.3,
                    onPageChanged: (indextoprightnew, reason) {
                      setState(() {
                        //_currenttoprightnew = indextoprightnew;
                      });
                    }),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Flexible(
                  child: IconButton(
                    onPressed: () => _controllerrighttop.previousPage(),
                    icon: const Icon(Icons.arrow_back, color: Colors.blue),
                  ),
                ),
                Flexible(
                  child: IconButton(
                    onPressed: () => _controllerrighttop.nextPage(),
                    icon: const Icon(Icons.arrow_forward, color: Colors.blue),
                  ),
                ),
              ],
            ),
            Expanded(
              child: CarouselSlider(
                items: allItemsSliders,
                carouselController: _controllerrightmid,
                options: CarouselOptions(
                    autoPlay: false,
                    enlargeCenterPage: true,
                    aspectRatio: 1.3,
                    onPageChanged: (indexmidrightnew, reason) {
                      setState(() {
                        //_currentmidrightnew = indexmidrightnew;
                      });
                    }),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Flexible(
                  child: IconButton(
                    onPressed: () => _controllerrightmid.previousPage(),
                    icon: const Icon(Icons.arrow_back, color: Colors.orange),
                  ),
                ),
                Flexible(
                  child: IconButton(
                    onPressed: () => _controllerrightmid.nextPage(),
                    icon: const Icon(Icons.arrow_forward, color: Colors.orange),
                  ),
                ),
              ],
            ),
            Expanded(
              child: CarouselSlider(
                items: allItemsSliders,
                carouselController: _controllerrightbot,
                options: CarouselOptions(
                    autoPlay: false,
                    enlargeCenterPage: true,
                    aspectRatio: 1.3,
                    onPageChanged: (indexbotrightnew, reason) {
                      setState(() {
                        //_currentbotrightnew = indexbotrightnew;
                      });
                    }),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Flexible(
                  child: IconButton(
                      onPressed: () => _controllerrightbot.previousPage(),
                      icon: const Icon(Icons.arrow_back, color: Colors.red)),
                ),
                Flexible(
                  child: IconButton(
                      onPressed: () => _controllerrightbot.nextPage(),
                      icon: const Icon(Icons.arrow_forward, color: Colors.red)),
                ),
              ],
            ),
          ]),
        ),
      ]),
    );
  }
}
