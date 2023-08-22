// login_screen
class UserNotFoundAuthException implements Exception {}
class WrongPasswordAuthException implements Exception {}

//registration_screen
class EmailAlreadyInUseAuthException implements Exception {}
class InvalidEmailAuthException implements Exception {}
class WeakPasswordAuthException implements Exception {}

//generic exception
class GenericAuthException implements Exception {}
class UserNotLoggedInAuthException implements Exception {}