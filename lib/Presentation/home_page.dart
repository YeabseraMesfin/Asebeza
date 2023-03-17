import 'package:asbeza/Presentation/history.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:asbeza/bloc/bloc/item_bloc.dart';
import 'package:asbeza/bloc/bloc/item_state.dart';
import 'package:asbeza/bloc/bloc/item_event.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex=1;
  void _onItemTapped(int index){
    BlocProvider(create: (context) => ItemBloc(),child: const HistoryPage(),);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      
      body: BlocBuilder<ItemBloc, ItemState>(
        builder: (context, state) {
          if (state is TestInitialState) {
            return Center(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    minimumSize: const Size(200, 50),
                    alignment: Alignment.center,
                    elevation: 0),
                onPressed: () {
                  BlocProvider.of<ItemBloc>(context)
                      .add(AsbezaFetchEvent());
                },
                icon: const Icon(Icons.shopping_basket_rounded),
                label: const Text("GET YOU ASBEZA"),
              ),
            );
          }
          if (state is TestLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TestSuccessState) {
            return Container(
              margin: const EdgeInsets.only(top: 5),
              height: MediaQuery.of(context).size.height * .88,
              child: ListView.builder(
                itemCount: state.asbeza.length,
                itemBuilder: (_, index){
                  final asbezaVal = state.asbeza[index];
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
                                        image: NetworkImage(asbezaVal.image))),
                                height: MediaQuery.of(context).size.height * .1,
                                width: MediaQuery.of(context).size.width * .3,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 11, vertical: 5),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                          IconButton(
                              onPressed: () {
                                BlocProvider.of<ItemBloc>(context)
                                    .add(HistoryEvent(asbeza: asbezaVal));
                              },
                              icon: const Icon(Icons.shopping_cart,color: Color.fromARGB(255, 128, 167, 129),))
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      )
                    ],
                  );
                },
              ),
            );
          }
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(Icons.shopping_cart),
        onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: ((context) => BlocProvider.value(value:BlocProvider.of<ItemBloc>(context),child: const HistoryPage(),))));
      },
      ),
    );
  }
}