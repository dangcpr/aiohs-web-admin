import 'package:aiohs_web_admin/job_posting/controllers/job_posting.dart';
import 'package:aiohs_web_admin/job_posting/cubits/get_job_posting/job_posting_state.dart';
import 'package:aiohs_web_admin/job_posting/models/job_posting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetJobPostingCubit extends Cubit<GetJobPostingState> {
  GetJobPostingCubit() : super(GetJobPostingInitial());

  List<JobPosting> jobPosting = [];
  String next = '0';

  Future<void> getJobPosting({
    String? status,
    String? user_code,
    String? code,
    String? from_date,
    String? to_date,
  }) async {
    emit(GetJobPostingLoading());
    try {
      JobPostingResult jobPostingResult = await JobPostingController().getJobPosting(next,
        status: status,
        user_code: user_code,
        code: code,
        from_date: from_date,
        to_date: to_date,
      );

      jobPosting.addAll(jobPostingResult.results);
      next = jobPostingResult.next;

      emit(GetJobPostingLoaded(jobPosting));
    } catch (e) {
      emit(GetJobPostingError(e.toString()));
    }
  }

  void initState() {
    jobPosting = [];
    next = '0';
    emit(GetJobPostingInitial());
  }
}