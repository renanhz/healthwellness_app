import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

class HomeNavigationBloc extends BlocBase {
  final BehaviorSubject<int> _navigationController =
      BehaviorSubject<int>.seeded(0);

  Stream<int> get outPage => _navigationController.stream;
  Sink<int> get inPage => _navigationController.sink;

  void changePage(pageController, index) {
    pageController.jumpToPage(index);
    inPage.add(index);
  }

  @override
  void dispose() {
    _navigationController.close();
    super.dispose();
  }
}
