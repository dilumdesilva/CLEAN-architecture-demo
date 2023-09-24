import 'package:clean_architecture_demo/app/di.dart';
import 'package:clean_architecture_demo/domain/entity/todo_entity.dart';
import 'package:clean_architecture_demo/domain/repository/todo_repository.dart';
import 'package:clean_architecture_demo/presentation/resources/assets_manager.dart';
import 'package:clean_architecture_demo/presentation/features/todo_cards/todo_cards_state.dart';
import 'package:clean_architecture_demo/presentation/features/todo_cards/todo_crads_cubit.dart';
import 'package:clean_architecture_demo/presentation/resources/font_manager.dart';
import 'package:clean_architecture_demo/presentation/resources/values_manager.dart';
import 'package:clean_architecture_demo/presentation/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TodoCardsScreen extends StatefulWidget {
  const TodoCardsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TodoCardsScreenState();
}

class _TodoCardsScreenState extends State<TodoCardsScreen> {
  late TodoCardsCubit _todoCardsCubit;
  late AppLocalizations l10n;

  @override
  void initState() {
    super.initState();
    initialise();
  }

  Future<void> initialise() async {
    if (mounted) {
      _todoCardsCubit =
          TodoCardsCubit(todoRepository: getItInstance.get<TodoRepository>());

      _todoCardsCubit.getTodoCards();
    }
  }

  @override
  void didChangeDependencies() {
    l10n = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(l10n.myTodos),
          actions: [
            _buildCalendarAppBarButton(),
          ],
        ),
        body: BlocProvider(
            create: (context) => _todoCardsCubit,
            child: BlocBuilder<TodoCardsCubit, TodoCardsState>(
                builder: (context, state) {
              switch (state.runtimeType) {
                case GetTodoCardsInProgress:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case GetTodoCardsSuccess:
                  final todoCards = (state as GetTodoCardsSuccess).todoCards;
                  return _buildBody(todoCards ?? []);
                case GetTodoCardsFailure:
                  return Center(
                    child: Column(
                      children: [
                        const Icon(Icons.error,
                            size: AppSize.s50, color: Colors.red),
                        Text(l10n.failedToFetchTodoCards),
                      ],
                    ),
                  );
              }

              return Container();
            })),
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
        },
        child: const Icon(
          Icons.calendar_month,
        ),
      ),
    );
  }

  Widget _buildBody(List<TodoEntity> todoCards) {
    return LayoutBuilder(builder: (context, dimens) {
      return ListView.builder(
        itemCount: todoCards.length,
        itemBuilder: (context, index) {
          return _buildCard(todoCards[index]);
        },
      );
    });
  }

  //TODO: extract out as a widget TodoCard
  Widget _buildCard(TodoEntity todoCard) {
    return Padding(
      padding: const EdgeInsets.only(
          top: AppPadding.p20, left: AppPadding.p16, right: AppPadding.p16),
      child: Dismissible(
        //TODO: models needs the ID from snapshot key
        key: const Key('card'),
        secondaryBackground: Container(
            color: Colors.red,
            child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: AppPadding.p16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.delete, color: Colors.white),
                    Padding(
                      padding: const EdgeInsets.only(top: AppPadding.p8),
                      child: Text(l10n.delete,
                          style: const TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ),
            )),
        background: Container(
            color: Colors.green,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: AppPadding.p16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ImageIcon(
                      AssetImage(AssetsManager.icons.pinIcon),
                      color: Colors.white,
                      //TODO: change the colour based on pinned or not
                      size: AppSize.s20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: AppPadding.p8),
                      child: Text(l10n.pinToTop,
                          style: const TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ),
            )), //TODO: replace with snapshot id
        child: Card(
            elevation: 2,
            color: Colors.grey.shade100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: AppPadding.p12,
                      left: AppPadding.p20,
                      right: AppPadding.p20),
                  child: SizedBox(
                    height: AppSize.s100,
                    width: getTodoCardTextAreaWidth(context),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(todoCard.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: FontSize.s20,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(height: AppSize.s8),
                        Text(todoCard.description,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: FontSize.s14)),
                        const SizedBox(height: AppSize.s24),

                        //TODO: get like todoCard.createdDate using timestamp
                        Text(getTodoCardDisplayDate(DateTime.now()),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: FontSize.s14)),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      right: AppPadding.p8, top: AppPadding.p8),
                  child: ImageIcon(
                    AssetImage(AssetsManager.icons.pinIcon),
                    color: Colors
                        .red, //TODO: change the colour based on pinned or not
                    size: AppSize.s20,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
