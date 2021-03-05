public class loginUserProfileCtrl {
    @AuraEnabled 
      public static user fetchUserDetail(){
          return [Select id,Name,SmallPhotoUrl, FullPhotoUrl From User Where Id =: Userinfo.getUserId()];
      }
  }
