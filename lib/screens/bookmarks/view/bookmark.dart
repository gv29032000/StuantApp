import 'package:flutter/material.dart';

class BookMarkView extends StatelessWidget {
  const BookMarkView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            backgroundColor: Colors.blue.shade400,
            snap: false,
            pinned: true,
            floating: true, //this make the work done.
            title: const Text(
              'WhatsApp',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            actions: const [
              IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.search_outlined,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.more_vert,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ],
            bottom: const TabBar(
                // controller: _tabController,

                indicatorColor: Colors.white,
                indicatorWeight: 3.0,
                tabs: [
                  Tab(
                    icon: Icon(Icons.train),
                  ),
                  Tab(
                    icon: Icon(Icons.train),
                  )
                ]),
          ),
        ],
        body: const TabBarView(
          // controller: _tabController,
          children: [
            Text('camera'),
            // ChatsScreen(),
            Text('camera2'),
            // Text('camera'),
          ],
        ),
        // ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
