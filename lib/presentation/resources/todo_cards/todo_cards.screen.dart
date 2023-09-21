import 'package:clean_architecture_demo/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class TodoCardsSecreen extends StatefulWidget {
  const TodoCardsSecreen({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TodoCardsSecreenState();
}

class _TodoCardsSecreenState extends State<TodoCardsSecreen> {
  int mockNumberOfCards = 10;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    //TODO: Initialize the localisation here
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My TODOs'),
          actions: [
            _buildCalendarAppBarButton(),
          ],
        ),
        body: _buildBody(),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              //TODO: build the navigation to next screen
            },
            child: const Icon(Icons.add)));
  }

  Widget _buildCalendarAppBarButton() {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p20),
      child: InkWell(
        onTap: () => {
          //TODO: navigate to calendar screen
          print('Calendar button tapped'),
        },
        child: const Icon(
          Icons.calendar_month,
        ),
      ),
    );
  }

  Widget _buildBody() {
    return LayoutBuilder(builder: (context, dimens) {
      return ListView.builder(
        itemCount: mockNumberOfCards,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: _buildCard(),
          );
        },
      );
    });
  }

  Widget _buildCard() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 16.0, right: 16.0),
      child: Dismissible(
        key: const Key('card'), //TODO: replace with snapshot id
        child: Card(
            elevation: 2,
            color: Colors.grey.shade100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 12.0, left: 20.0, right: 20.0),
                  child: SizedBox(
                    height: 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Title'),
                        SizedBox(height: 8),
                        Text('Description'),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8, top: 8),
                  child: InkWell(
                    onLongPress: () => {
                      //TODO: show toast
                      //Pin the card to top
                    },
                    child: const Icon(
                      Icons.pin_drop,
                      size: 24,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
