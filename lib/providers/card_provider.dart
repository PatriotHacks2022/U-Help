import 'package:flutter/material.dart';

enum CardStatus { like, dislike, superLike }

class CardProvider extends ChangeNotifier {
  List<String> _urlImages = [];
  bool _isDragging = false;
  Offset _position = Offset.zero;
  double _angle = 0;
  Size _screenSize = Size.zero;
  bool isExpanded = false;

  List<String> get urlImages => _urlImages;
  Offset get position => _position;
  bool get isDragging => _isDragging;
  double get angle => _angle;

  CardProvider() {
    // TODO: This would load in from the database
    resetUsers();
  }

  /// Dragging started at the start position.
  void startPosition(DragStartDetails details) {
    _isDragging = true;
    notifyListeners();
  }

  /// Update the position of the card.
  void updatePosition(DragUpdateDetails details) {
    // change our position.
    _position += details.delta;

    // get x position of the card.
    final x = _position.dx;

    // set card angle to 45 based of the direction its being dragged.
    _angle = 45 * x / _screenSize.width;

    // update the UI.
    notifyListeners();
  }

  /// Set the position of the card back to its inital position.
  void endPosition() {
    // complete the animation for the card.
    _isDragging = false;
    notifyListeners();

    final status = getStatus();

    if (status != null) {}

    switch (status) {
      case CardStatus.like:
        like();
        break;
      case CardStatus.dislike:
        dislike();
        break;
      case CardStatus.superLike:
        superLike();
        break;
      default:
        resetPosition();
    }
  }

  /// Reset the position and angle of the card.
  void resetPosition() {
    _isDragging = false;
    _position = Offset.zero;
    _angle = 0;

    notifyListeners();
  }

  /// Set the screen size.
  void setScreenSize(Size screenSize) {
    _screenSize = screenSize;
  }

  /// Resets the cards. Temporary.
  void resetUsers() {
    _urlImages = <String>[
      "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fA%3D%3D&w=1000&q=80",
      "https://picsum.photos/seed/image009/500/500",
      "https://picsum.photos/seed/image010/500/500",
      "https://i.imgur.com/9h66HBP.png"
    ].reversed.toList();

    notifyListeners();
  }

  /// Get the (like, dislike, superlike) status of the card
  CardStatus? getStatus() {
    final x = _position.dx;
    final y = _position.dy;
    final forceSuperLike = x.abs() < 20;
    const delta = 100;

    // check if card has been swiped right.
    if (x >= delta) {
      return CardStatus.like;
    } else if(x <= -delta) {
      return CardStatus.dislike;
    }else if(y <= -delta / 2 && forceSuperLike){
      return CardStatus.superLike;
    }
  }

  /// finish the like animation.
  void like() {
    _angle = 20;
    _position += Offset(2 * _screenSize.width, 0);
    _nextCard();

    notifyListeners();
  }

  /// finish the dislike animation.
  void dislike() {
    _angle = -20;
    _position -= Offset(2 * _screenSize.width, 0);
    _nextCard();

    notifyListeners();
  }

  /// finish the superlike animation.
  void superLike() {
    _angle = 0;
    _position -= Offset(0, _screenSize.height);
    _nextCard();

    notifyListeners();
  }

  /// Load the next card on the stack.
  Future _nextCard() async {
    if (_urlImages.isEmpty) return;

    // wait until the card animation.
    await Future.delayed(const Duration(milliseconds: 200));
    _urlImages.removeLast();
    resetPosition();
  }

  /// Expand card when tapped.
  void expandCard(){
    if(isExpanded){
      isExpanded = false;
    }else{
      isExpanded = true;
    }
    notifyListeners();
  }
}
