import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            _appBar(),
            // _body(),
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
    return Container();
  }
}
