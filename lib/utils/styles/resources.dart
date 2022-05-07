class Resources {
  static String hintText = 'Dogecoin to the Moon';
  static String hintTextName = 'Name';
  static String hintTextEmail = 'Email';
  static String hintTextPassword = 'Password';
  static String labelSeeAll = 'See All';
  static String labelLatestNews = 'Latest News';
  static String labelFilter = 'Filter';

  // News Categories
  static List<String> sourceList = [
    'Business',
    'Health',
    'Technology',
    'Entertainment',
    'General',
    'Science',
    'Sports'
  ];

  //Icons path
  static String parentPath = 'assets/images/';
  static String icSearch = parentPath + 'ic_search.png';
  static String icCancel = parentPath + 'ic_cancel.png';
  static String icBell = parentPath + 'ic_bell.png';
  static String icHome = parentPath + 'ic_home.png';
  static String icFavourite = parentPath + 'ic_favourite.png';
  static String icProfile = parentPath + 'ic_profile.png';
  static String icRightArrow = parentPath + 'ic_right_arrow.png';
  static String icBack = parentPath + 'ic_back.png';

  //Strings
  static String errMsgIncorrectUserNameOrPassword =
      'Incorrect username or password';
  static String error = 'Error';
  static String networkError = 'Network error';
  static String somethingWentWrong = 'Something went wrong, Please try again.';
  static String sendTimeout = 'Receive timeout in send request';
  static String receiveTimeout = 'Receive timeout in connection';
  static String internetConnectionError =
      'Connection failed due to internet connection';
  static String connectionTimeout = 'Connection timeout';
  static String requestCancelError = 'Request was cancelled';
  static String errMsgInvalidEmail = 'Please insert a valid email';
  static String isRequired = 'is required';
  static String labelWelcome = 'Welcome\nBack';
  static String labelSignup = 'Sign up';
  static String labelSignin = 'Sign in';
  static String labelCreateAccount = 'Create\nAccount';
  static String labelLogout = 'Logout';
  static String labelOk = 'Ok';
  static String labelConfirm = 'Confirm';
  static String confirmAlertToLogout = 'Are you sure you want to log out? Confirm and log out.';
}
