class Fkeys {
  String keyNotificationFavouritePlace = 'notificationFavouriteDestination';
  String keyNotificationAddDiscussionForm = 'notificationAddDiscussionForum';
  String keyNotificationInterestMyTravel = 'notificationInterestedMyTravel';
  String keyNotificationLikeMyFeed = 'notificationLikeFeed';
  String keyNotificationLikeMyDiscussionForum =
      'notificationLikeMyDiscussionForum';
  String keyNotificationLikeMyTravel = 'notificationLikeMyTravel';
  String keyNotificationPrivateChat = 'notificationPrivateChat';
  String keyNotificationAnyoneComment = 'notificationAnyoneComment';
}

class SetKeysForNotification {
  final favouritePlace = Fkeys().keyNotificationFavouritePlace;
  final discussionForum = Fkeys().keyNotificationAddDiscussionForm;
  final interestMyTravel = Fkeys().keyNotificationInterestMyTravel;
  final likeMyFeed = Fkeys().keyNotificationLikeMyFeed;
  final likeMyDiscussionForum = Fkeys().keyNotificationLikeMyDiscussionForum;
  final likeMyTravel = Fkeys().keyNotificationLikeMyTravel;
  final privateChat = Fkeys().keyNotificationPrivateChat;
  final anyoneComment = Fkeys().keyNotificationAnyoneComment;
}
