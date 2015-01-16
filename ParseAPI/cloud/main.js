
// Use Parse.Cloud.define to define as many cloud functions as you want.
// For example:
Parse.Cloud.define("hello", function(request, response) {
  response.success("Hello world!");
});

Parse.Cloud.define("getCommentsForUser", function(request, response) {
  var query = new Parse.Query("Comment");
  var currentUser = Parse.User.current();
  if (currentUser) {
      query.equalTo("user_id", currentUser);
      query.find({
        success: function(results) {      
          response.success(results);
        },
        error: function() {
          response.error("comments lookup failed for user_id "+request.params.user_id);
        }
      });
  } else {
      response.error("user is not authenticated");
  }
  
});
