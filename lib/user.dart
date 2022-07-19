// Создайте класс User, у которого есть поле email. Реализуйте два наследника данного класса AdminUser и GeneralUser.
// Реализуйте mixin над классом User, у которого будет метод getMailSystem, который возвращает значение из email, которое находится после @.
// Например, если email пользователя user@mail.ru, то данный метод вернёт mail.ru. Используйте данный миксин на AdminUser.
// Далее реализуйте класс UserManager<T extends User>, у которого будет храниться список пользователей и будут методы добавления или удаления их.
// Также в UserManager реализуйте метод, который выведет почту всех пользователей, однако если пользователь admin, будет выведено значение после @.
// Проверьте реализованные методы на практике.

abstract class User {
  String email;
  User(this.email);
}

class AdminUser extends User with UserEmailMixin {
  AdminUser(super.email);
}

class GeneralUser extends User {
  GeneralUser(super.email);
}

mixin UserEmailMixin on User {
  String getMailSystem() {
    if (email.contains('@') && !email.endsWith('@')) {
      return email.substring(email.lastIndexOf('@') + 1);
    }
    throw Exception('Wrong email');
  }
}

class UserManager<T extends User> {
  final List<T> _users = [];

  void add(T user) {
    _users.add(user);
  }

  void remove(T user) {
    _users.remove(user);
  }

  List<String> getEmails() {
    return _users
        .map((e) => e is AdminUser ? e.getMailSystem() : e.email)
        .toList();
  }
}
