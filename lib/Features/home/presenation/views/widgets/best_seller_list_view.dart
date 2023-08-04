import 'package:bookly/Features/home/presenation/viewmodel/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly/core/widgets/custom_error%20widget.dart';
import 'package:bookly/core/widgets/custom_loading_indecator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Best_seller_item_view.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: state.books.length,
                    itemBuilder: (context, index) {
                      return  Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: BestSellerListViewItem(
                          bookModel:  state.books[index],
                        ),
                      );
                    }
                  );
        }else if(state is NewestBooksFailure) {

        return  CustomErrorWidget(errorMessage: state.errorMessage,);
        } else
          {return const CustomLoadingIndicator();}
      },
    );
  }
}
