class User {
  final int? appUserPk;
  final int? orgFk;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;
  final String? mobileNo;
  final String? userType;
  final String? createJobFlag;
  final String? completeJobFlag;

  User({
    this.appUserPk,
    this.orgFk,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.mobileNo,
    this.userType,
    this.createJobFlag,
    this.completeJobFlag,
  });

  User copyWith({
    int? appUserPk,
    int? orgFk,
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? mobileNo,
    String? userType,
    String? createJobFlag,
    String? completeJobFlag,
  }) {
    return User(
      appUserPk: appUserPk ?? this.appUserPk,
      orgFk: orgFk ?? this.orgFk,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
      mobileNo: mobileNo ?? this.mobileNo,
      userType: userType ?? this.userType,
      createJobFlag: createJobFlag ?? this.createJobFlag,
      completeJobFlag: completeJobFlag ?? this.completeJobFlag,
    );
  }

  User.fromJson(Map<String, dynamic> json)
    : appUserPk = json['app_user_pk'] as int?,
      orgFk = json['org_fk'] as int?,
      firstName = json['first_name'] as String?,
      lastName = json['last_name'] as String?,
      email = json['email'] as String?,
      password = json['password'] as String?,
      mobileNo = json['mobile_no'] as String?,
      userType = json['user_type'] as String?,
      createJobFlag = json['create_job_flag'] as String?,
      completeJobFlag = json['complete_job_flag'] as String?;

  Map<String, dynamic> toJson() => {
    'app_user_pk' : appUserPk,
    'org_fk' : orgFk,
    'first_name' : firstName,
    'last_name' : lastName,
    'email' : email,
    'password' : password,
    'mobile_no' : mobileNo,
    'user_type' : userType,
    'create_job_flag' : createJobFlag,
    'complete_job_flag' : completeJobFlag
  };
}