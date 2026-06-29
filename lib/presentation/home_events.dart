sealed class HomeEvents {}

class LoadData extends HomeEvents {}

sealed class HomeUIEvents {}

class ShowMessage extends HomeUIEvents {
  String message;

  ShowMessage(this.message);
}
