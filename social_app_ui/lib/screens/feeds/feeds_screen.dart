import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media_app/strings/strings.dart';
import 'package:social_media_app/widgets/custom_feed_card.dart';

class FeedsScreen extends StatelessWidget {
  static const id = '/FeedsScreen';

  const FeedsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: Theme.of(context).brightness == Brightness.light
            ? SystemUiOverlayStyle.dark
            : SystemUiOverlayStyle.light,
        leading: IconButton(
          icon: const Icon(
            Icons.camera_alt_outlined,
            size: 24,
            color: Colors.grey,
          ),
          onPressed: () {},
        ),
        title: Text(
          S.feeds,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: CircleAvatar(
              radius: 20.r,
              backgroundColor: Colors.grey,
            ),
          )
        ],
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 33.h,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, index) => CustomFeedCard(),
              childCount: 5,
            ),
          )
        ],
      ),
    );
  }
}
