import 'package:aiohs_web_admin/job_posting/models/job_posting.dart';

abstract class GetJobPostingState {}

class GetJobPostingInitial extends GetJobPostingState {}

class GetJobPostingLoading extends GetJobPostingState {}

class GetJobPostingLoaded extends GetJobPostingState {
  final List<JobPosting> jobPosting;

  GetJobPostingLoaded(this.jobPosting);
}

class GetJobPostingError extends GetJobPostingState {
  final String message;

  GetJobPostingError(this.message);
}