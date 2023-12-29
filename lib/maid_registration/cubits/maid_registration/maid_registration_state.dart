import 'package:aiohs_web_admin/maid_registration/models/maid_registration.dart';

abstract class MaidRegistrationState {}

class MaidRegistrationInitial extends MaidRegistrationState {}

class MaidRegistrationLoading extends MaidRegistrationState {}

class MaidRegistrationSuccess extends MaidRegistrationState {
  final MaidRegistrationResult maidRegistrationResult;

  MaidRegistrationSuccess({required this.maidRegistrationResult});
}

class MaidRegistrationFailure extends MaidRegistrationState {
  final String error;

  MaidRegistrationFailure({required this.error});
}