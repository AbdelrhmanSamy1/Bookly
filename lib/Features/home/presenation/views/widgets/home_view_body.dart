
import 'package:flutter/material.dart';
import '../../../../../../core/utils/styles.dart';
import 'best_seller_list_view.dart';
import 'custom_app_bar.dart';
import 'featured_list-view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: CustomAppBar(),
              ),
              FeaturedBooksListView(),
              SizedBox(height: 20,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                    'Best Seller',
                    style: Styles.textStyle18
                ),
              ),
              SizedBox(height: 20,),
            ],
          ),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: BestSellerListView(),
          ),
        )
      ],
    );
  }
}
