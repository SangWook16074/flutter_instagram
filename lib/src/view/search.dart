import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            _appBar(),
            _body(),
          ],
        ),
      ),
    );
  }

  Widget _appBar() {
    return SliverAppBar(
      floating: true,
      title: InkWell(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.all(9.0),
          margin: const EdgeInsets.all(2.0),
          height: 40,
          decoration: BoxDecoration(
              color: Colors.black12, borderRadius: BorderRadius.circular(8.0)),
          child: const Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.0),
                child: Icon(
                  Icons.search,
                  color: Color(0xff7d7d7d),
                ),
              ),
              Text(
                '검색',
                style: TextStyle(color: Color(0xff7d7d7d)),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _body() {
    return SliverGrid.builder(
      gridDelegate: SliverQuiltedGridDelegate(
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
        crossAxisCount: 3,
        repeatPattern: QuiltedGridRepeatPattern.same,
        pattern: [
          //패턴 1
          const QuiltedGridTile(1, 1),
          const QuiltedGridTile(1, 1),
          const QuiltedGridTile(2, 1),
          const QuiltedGridTile(1, 1),
          const QuiltedGridTile(1, 1),
          //패턴 2
          const QuiltedGridTile(2, 1),
          const QuiltedGridTile(1, 1),
          const QuiltedGridTile(1, 1),
          const QuiltedGridTile(1, 1),
          const QuiltedGridTile(1, 1),
          //패턴 3
          const QuiltedGridTile(1, 1),
          const QuiltedGridTile(1, 1),
          const QuiltedGridTile(2, 1),
          const QuiltedGridTile(1, 1),
          const QuiltedGridTile(1, 1),
          //패턴 4
          const QuiltedGridTile(2, 2),
          const QuiltedGridTile(1, 1),
          const QuiltedGridTile(1, 1),
          //패턴 5
          const QuiltedGridTile(1, 1),
          const QuiltedGridTile(1, 1),
          const QuiltedGridTile(2, 1),
          const QuiltedGridTile(1, 1),
          const QuiltedGridTile(1, 1),
          //패턴 6
          const QuiltedGridTile(2, 1),
          const QuiltedGridTile(1, 1),
          const QuiltedGridTile(1, 1),
          const QuiltedGridTile(1, 1),
          const QuiltedGridTile(1, 1),
          //패턴 7
          const QuiltedGridTile(1, 1),
          const QuiltedGridTile(1, 1),
          const QuiltedGridTile(2, 1),
          const QuiltedGridTile(1, 1),
          const QuiltedGridTile(1, 1),
          //패턴 8
          const QuiltedGridTile(2, 1),
          const QuiltedGridTile(1, 1),
          const QuiltedGridTile(1, 1),
          const QuiltedGridTile(1, 1),
          const QuiltedGridTile(1, 1),
        ],
      ),
      itemCount: 50,
      itemBuilder: (context, index) => Container(
        color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
      ),
    );
  }
}
