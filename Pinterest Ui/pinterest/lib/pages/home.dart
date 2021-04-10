import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePage extends StatelessWidget{
  HomePage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.black,
      body: LayoutUi()
    );
  }
}

List<StaggeredTile> _staggeredTiles = const <StaggeredTile>[
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 2),
  const StaggeredTile.count(1, 2),
  const StaggeredTile.count(1, 2),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 2),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 2),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 2),
  const StaggeredTile.count(1, 1),
];


List<Widget> _tiles = const <Widget>[
  const _TileUi('https://firebasestorage.googleapis.com/v0/b/flutterintro-3a3f4.appspot.com/o/bus.gif?alt=media&token=de9283b6-7560-4bad-9942-250337a9d83d'),
  const _TileUi('https://www.hdwallpapersnature.com/wp-content/uploads/2019/05/Awesome-HD-Wallpapers-Nature-Portrait-Mode-1.jpg'),
  const _TileUi('https://fsa.zobj.net/crop.php?r=ztVQjAUUG7i-CXjVyUnly5arWIubIJdeFgG5ngwfG64XxAwwWhXf_Bj4Eslc2AtPewVGHAP3eQNyw58eNGdUZKiIVKViZY7p2lI1dNbJPbDAD5iHdyvQghUeOCDPOjOMB04fLcIS8SIJcIQ1'),
  const _TileUi('https://www.desktopbackground.org/download/1440x2560/2013/11/07/666494_horsehead-nebula-hubble-wallpapers-page-3-pics-about-space_5077x3200_h.jpg'),
  const _TileUi('https://fsa.zobj.net/crop.php?r=FU9ixxhv6JhuVHkZx_YNltVHAUkipEyQHSfi2cZB8BDm4arMjaTJS22BnWZXrc7jworsPxcuqmwMsfaHCbqX6GI0Vy18hquJenuoKT0AKieMjCXjst5DPfFrR3jnNlfu7CGlpfuA8BMypV78'),
  const _TileUi('https://cutewallpaper.org/21/wallpapers-of-the-joker/Joker-2019-Wallpapers-Wallpaper-Cave.jpg'),
  const _TileUi('https://i.pinimg.com/564x/7b/de/d0/7bded00c6a26a348d941017f93221053.jpg'),
  const _TileUi('https://images.indianexpress.com/2018/09/paulo-dybala-1200.jpg'),
  const _TileUi('https://images.indianexpress.com/2018/09/paulo-dybala-1200.jpg'),
  const _TileUi('https://i.pinimg.com/474x/d6/9a/4a/d69a4a716de05c41e7ed8f35dda888cc.jpg'),
  const _TileUi('https://image.winudf.com/v2/image/Y29tLmFuZHJvbW8uZGV2NjYwNjE0LmFwcDcyNjIyNF9zY3JlZW5fMV8xNTE2Nzc0MDU1XzAwNw/screen-1.jpg?fakeurl=1&type=.jpg'),
  const _TileUi('https://i.pinimg.com/originals/ed/00/a2/ed00a2d584dc5b277580e2b53b9e0b4d.jpg'),
];


class LayoutUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: new StaggeredGridView.count(
              crossAxisCount: 2,
              staggeredTiles: _staggeredTiles,
              children: _tiles,
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
              padding: const EdgeInsets.all(4.0),
            )
    );
  }
}

class _TileUi extends StatelessWidget {
  const _TileUi(this.imageData);
  final imageData;
  @override
  Widget build(BuildContext context) {
    return new ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(40.0),
        topLeft: Radius.circular(40.0),
        bottomLeft: Radius.circular(40.0),
        bottomRight: Radius.circular(40.0),
      ),
      child: new Card(
        color: Colors.black,
        child: new InkWell(
          onTap: () {},
          child: new Center(
            child: new Padding(
              padding: const EdgeInsets.all(4.0),
              child: new Container(
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                      image: NetworkImage(imageData),
                      fit: BoxFit.cover
                  ),
                ),
              )
            ),
          ),
        ),
      ),
    );
  }
}
