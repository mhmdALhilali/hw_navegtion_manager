class UserModel {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String? profileImage;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    this.profileImage,
  });

  // تحويل من Map إلى UserModel
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      profileImage: map['profileImage'],
    );
  }

  // تحويل UserModel إلى Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'profileImage': profileImage,
    };
  }
}

class UserService {
  static UserModel? _currentUser;

  // حفظ بيانات المستخدم بعد تسجيل الدخول
  static void setUser(UserModel user) {
    _currentUser = user;
  }

  // الحصول على بيانات المستخدم الحالي
  static UserModel? get currentUser => _currentUser;

  // تسجيل الخروج
  static void logout() {
    _currentUser = null;
  }

  // التحقق إذا كان هناك مستخدم مسجل
  static bool get isLoggedIn => _currentUser != null;
}