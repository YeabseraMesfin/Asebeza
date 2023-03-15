import 'package:asbeza/Presentation/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:ASBEZA/views/components/myDrawer.dart';

import 'package:asbeza/bloc/bloc/item_bloc.dart';
import 'package:asbeza/bloc/bloc/item_state.dart';
// import 'components/myAppBar.dart';


class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Shop'),centerTitle: true,),
          
      body: BlocBuilder<ItemBloc, ItemState>(
        builder: (context, state) {
          if (state is TestInitialState) {
            return const Center(
                child: Text(
              "NO HISTORY TO SHOW!\n TOTAL: 0\$",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ));
          }
          if (state is TestLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TestSuccessState) {
            if (state.history.isEmpty) {
              return const Center(
                  child: Text(
                "NO HISTORY TO SHOW!\n TOTAL: 0\$",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ));
            } else {
              // ignore: non_constant_identifier_names
              num TotalPrice = 0;
              // ignore: no_leading_underscores_for_local_identifiers
              void _incrementCounter() {
                for (var element in state.history) {
                  TotalPrice += element.price;
                }
              }

              _incrementCounter();
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "TOTAL: ${TotalPrice.toStringAsFixed(2)}\$",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w900),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    height: MediaQuery.of(context).size.height * .84,
                    child: ListView.builder(
                      itemCount: state.history.length,
                      itemBuilder: (context, index) {
                        final asbezaVal = state.history[index];
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.contain,
                                              image: NetworkImage(
                                                  asbezaVal.image))),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .1,
                                      width: MediaQuery.of(context).size.width *
                                          .3,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 11, vertical: 5),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          .4,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(asbezaVal.name),
                                          Text(
                                            "${asbezaVal.price}\$",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w900),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            )
                          ],
                        );
                      },
                    ),
                  ),
                ],
              );
            }
          }
          return Container();
        },
      ),
    );
  }
}