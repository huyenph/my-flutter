const fetchJobs = r'''
  query fetchJobs() {
    jobs {
      id,
      title,
      locationNames,
      isFeatured
    }
  }
  ''';
