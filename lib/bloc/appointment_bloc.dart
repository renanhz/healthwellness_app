import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:get_it/get_it.dart';
import 'package:healthwellness/models/appointment_model.dart';
import 'package:healthwellness/services/appointment_service.dart';
import 'package:healthwellness/utils/state_enum.dart';
import 'package:rxdart/rxdart.dart';

class AppointmentBloc extends BlocBase {
  final BehaviorSubject<List<AppointmentModel>> _appointmentListController =
      BehaviorSubject<List<AppointmentModel>>.seeded([]);

  Sink<List<AppointmentModel>> get inAppointmentList =>
      _appointmentListController.sink;

  Stream<List<AppointmentModel>> get outAppointmentList =>
      _appointmentListController.stream;

  final BehaviorSubject<AppointmentListState> _appointmentStateController =
      BehaviorSubject<AppointmentListState>();
  Sink<AppointmentListState> get inAppointmentState =>
      _appointmentStateController.sink;
  Stream<AppointmentListState> get outAppointmentState =>
      _appointmentStateController.stream;

  final BehaviorSubject<AppointmentDetailState>
      _appointmentDetailStateController =
      BehaviorSubject<AppointmentDetailState>();

  Sink<AppointmentDetailState> get inAppointmentDetailState =>
      _appointmentDetailStateController.sink;

  Stream<AppointmentDetailState> get outAppointmentDetailState =>
      _appointmentDetailStateController.stream;

  final BehaviorSubject<AppointmentModel> _appointmentDetailController =
      BehaviorSubject<AppointmentModel>();
  Sink<AppointmentModel> get inAppointmentDetail =>
      _appointmentDetailController.sink;
  Stream<AppointmentModel> get outAppointmentDetail =>
      _appointmentDetailController.stream;

  AppointmentService appointmentService =
      GetIt.I.get<AppointmentService>(instanceName: 'appointmentService');

  Future<void> downloadAppointmentList() async {
    inAppointmentState.add(AppointmentListState.LOADING);

    appointmentService
        .downloadAppointmentList()
        .then((List<AppointmentModel> appointmentList) {
      inAppointmentList.add(appointmentList);
      inAppointmentState.add(AppointmentListState.SUCCESS);
    }).catchError((e) {
      inAppointmentState.add(AppointmentListState.FAIL);
    });
  }

  Future<void> downloadAppointmentDetail(int id) async {
    inAppointmentDetailState.add(AppointmentDetailState.LOADING);

    appointmentService
        .downloadAppointment(id)
        .then((AppointmentModel appointment) {
      inAppointmentDetail.add(appointment);
      inAppointmentDetailState.add(AppointmentDetailState.SUCCESS);
    }).catchError((e) {
      inAppointmentDetailState.add(AppointmentDetailState.FAIL);
    });
  }

  @override
  void dispose() {
    super.dispose();

    _appointmentListController.close();
    _appointmentStateController.close();
    _appointmentDetailController.close();
    _appointmentDetailStateController.close();
  }
}
