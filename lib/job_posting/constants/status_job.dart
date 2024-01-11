class StatusJob {
  String status;
  String name;

  StatusJob({
    required this.status,
    required this.name,
  });
}

List<StatusJob> statusJobs = [
  StatusJob(status: 'JOB_POSTING_STATUS_ACTIVE', name: 'Đang hoạt động'),
  StatusJob(status: 'JOB_POSTING_STATUS_INACTIVE', name: 'Đã đóng'),
];