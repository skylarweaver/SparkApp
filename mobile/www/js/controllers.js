angular.module('starter.controllers', [])


.controller('BorrowCtrl', function($scope, Devices, Chargers, Owned_Devices, Register) {
  Owned_Devices.query().$promise.then(function(response){
    $scope.owned_devices = response;
  });
  Chargers.query().$promise.then(function(response){
    $scope.chargers = response;
    console.log($scope.chargers);
  });
  Owned_Devices.query().$promise.then(function(response){
    $scope.owned_devices = response;
  });
})


.controller('BorrowDetailCtrl', function($scope, $stateParams, Owned_Devices) {
  $scope.hours = 0;
  $scope.minutes = 0;
  $scope.drag = function(value) {
    $scope.hours = Math.floor(value/60);
    $scope.minutes = value % 60;
  };

  $scope.rangeValue = 0;

  owned_deviceID = $stateParams.owned_deviceID;
  console.log("OWNED DEVICE ID, this is the id of the device you just clicked on");
  console.log($stateParams.owned_deviceID);
  $scope.item_details = Owned_Devices.get({id: $stateParams.owned_deviceID});

  $scope.findLenders = function() {
    //get list of users with the device
      $scope.a = Owned_Devices.get({id: $scope.item_details.charger_id});

    //find users with the device, then filter by who is nearby? 
    //or is opposite quicker
    //doesn't really matter for us i guess..
    console.log("todo")
  }

})


.controller('LendCtrl', function($scope, Logout, Devices, Chargers, Owned_Devices, $window, $location, Auth, $ionicPopup) {
  $scope.settings = {
    enableLending: true
  };

  Devices.query().$promise.then(function(response){
    $scope.devices = response;
    // console.log($scope.devices);
  });

  Chargers.query().$promise.then(function(response){
    $scope.chargers = response;
    // console.log($scope.chargers);
  });

  Owned_Devices.query().$promise.then(function(response){
    $scope.owned_devices = response;
  });

  $scope.userId = $window.localStorage['userId'];
  $scope.userFirstName = $window.localStorage['userFirstName'];

  // console.log('ContactCtrl started');

  $scope.toggleChange = function(owned_device) {
      //I think the toggle automatically changes the value of allow_lending
      if (owned_device.allow_lending == false) {
          // owned_device.allow_lending = true;
          //if toggle changed value to false, update the database to reflect that change
          Owned_Devices.update({id: owned_device.id, allow_lending: false},
          function(data){
          },
          function(err){
            var error = "";
            var errors = err["data"]["errors"];
            for (var k in errors) {
              error += k.charAt(0).toUpperCase() + k.replace(/_/g, ' ').substring(1) + ' ' + errors[k] + '. ';
            }
            var confirmPopup = $ionicPopup.alert({
              title: 'An error occured',
              template: error
            });
          }
        );

      } else {
        // owned_device.allow_lending = false;
        console.log(owned_device.id);
        Owned_Devices.update({id: owned_device.id, allow_lending: true},
        function(data){
        },
        function(err){
          var error = "";
          var errors = err["data"]["errors"];
          for (var k in errors) {
            error += k.charAt(0).toUpperCase() + k.replace(/_/g, ' ').substring(1) + ' ' + errors[k] + '. ';
          }
          var confirmPopup = $ionicPopup.alert({
            title: 'An error occured',
            template: error
          });
        }
      );
      }

      // $window.location.reload();  
      console.log('id:' + owned_device.id + 'testToggle changed to ' + owned_device.allow_lending);
  };

  $scope.logout = function() {
    // This database call might not be necessary, if all that's needed is to removeItems...
    Logout.delete(
      function(data){
        $window.localStorage.removeItem('userToken');
        $window.localStorage.removeItem('userEmail');
        $window.localStorage.removeItem('userId');
        $window.localStorage.removeItem('userFirstName');
        //Reload all controllers
        $window.location.reload();  
        $location.path('/login');
      },
      function(err){
        var error = err["data"]["errors"] || err["data"]["errors"].join('. ')
        var confirmPopup = $ionicPopup.alert({
          title: 'An error occured',
          template: error
        });
      }
    );
  }
})


.controller('TransactionCtrl', function($scope, Transactions) {
    Transactions.query().$promise.then(function(response){
    $scope.transactions = response;
    console.log($scope.transactions);
  });
})


.controller('LendDetailCtrl', function($scope, $stateParams, $window, $filter, Owned_Devices) {
  // $stateparams access the parameter that was passed through the url
  // defined in app.js lend_detail state
  owned_deviceID = $stateParams.owned_deviceID;
  console.log("OWNED DEVICE ID");
  console.log($stateParams.owned_deviceID);
  
  // Not sure if we can pass in a parameter (1) like that for query
  //*** don't think we can, it just returns the whole endpoint anyways
  Owned_Devices.query(1).$promise.then(function(response){
    $scope.owned_devices = response;
    console.log($scope.owned_devices);
  });

  //.get currently gets devices by userId, not device_id
  // owned_devices = Owned_Devices.get(1);//$window.localStorage['userId']);

  // (failed) Attempt to convert json to array.
  // owned_devices_array = [];
  // angular.forEach(owned_devices, function(element) {
  //   owned_devices_array.push(element);
  // });
  // $scope.owned_device = $filter('filter')(owned_devices_array, {id: owned_deviceID}, true)

})


.controller('LoginCtrl', function($scope, $location, Auth, $window, Login, $ionicPopup, $rootScope, Register) {
  $scope.data = {};

  $scope.login = function() {
    Login.save({user: $scope.data.user},
      function(data){
        Auth.set(data);
        $location.path('/tab/borrow');
          console.log("START")
          // console.log($window.localStorage['userEmail'])
          console.log($scope.data.user)
          // console.log("Data:", data)
          console.log(data.user_token)
          console.log(data.token)
          console.log(data.user_email)
          console.log($window.localStorage['userEmail'])
          console.log($window.localStorage['userToken'])


          console.log("END")
      },
      function(err){
        var confirmPopup = $ionicPopup.alert({
          title: 'An error occured',
          template: "Invalid username or password."
        });
      }
    );
  }
})


.controller('RedirectCtrl', function($scope, $location, $window,$rootScope) {
    $scope.$on('$ionicView.enter', function () {
      //Is this the most secure way to do this?
      var email = $window.localStorage['userEmail'];
      // console.log("Inside RedirectCtrl:")
      // console.log(email)
      if (email) {
          //user already logged in
          $location.path('/tab/lend');
      } else {
        //user not logged in
        $location.path('/login');
      }
    });
})


.controller('UserDetailCtrl', function($scope, $stateParams, $window, $filter, $ionicPopup, Users, UpdateUsers) {
  // $stateparams access the parameter that was passed through the url
  // defined in app.js lend_detail state
  userId = 6 //$stateParams.userId;
  $scope.data = {}
  $scope.data.user = Users.get(6)

  $scope.update = function(){
    UpdateUsers.update({id: userId,
     first_name: $scope.data.user.first_name, last_name: $scope.data.user.last_name},
      function(data){
        Auth.set({user_email: data.user_email});
        $location.path('/tab/lend');
      },
      function(err){
        var error = "";
        var errors = err["data"]["errors"];
        for (var k in errors) {
          error += k.charAt(0).toUpperCase() + k.replace(/_/g, ' ').substring(1) + ' ' + errors[k] + '. ';
        }
        var confirmPopup = $ionicPopup.alert({
          title: 'An error occured',
          template: error
        });
      }
    );
  }
})


.controller('RegisterCtrl', function($scope, $location, Auth, $window, Register, $ionicPopup, $rootScope) {
$scope.data = {};

$scope.register = function() {
  Register.save({user: $scope.data.user},
    function(data){
      Auth.set({user_token: data.user_token,
                user_email: data.user_email});
      $location.path('/tab/borrow');
    },
    function(err){
      var error = "";
      var errors = err["data"]["errors"];
      for (var k in errors) {
        error += k.charAt(0).toUpperCase() + k.replace(/_/g, ' ').substring(1) + ' ' + errors[k] + '. ';
      }
      var confirmPopup = $ionicPopup.alert({
        title: 'An error occured',
        template: error
      });
    }
  );
}
})




















// /mobile/www/controllers.js
// .controller('LoginCtrl', function($scope, $location, UserSession, $ionicPopup, $rootScope) {
// $scope.data = {};

// $scope.login = function() {
//   var user_session = new UserSession({ user: $scope.data });
//   user_session.$save(
//     function(data){
//       window.localStorage['userId'] = data.id;
//       window.localStorage['userName'] = data.name;
//       $location.path('/tab/borrow');
//     },
//     function(err){
//       var error = err["data"]["error"] || err.data.join('. ')
//       var confirmPopup = $ionicPopup.alert({
//         title: 'An error occured',
//         template: error
//       });
//     }
//   );
// }
// })



.controller('ChatsCtrl', function($scope, Chats) {
  // With the new view caching in Ionic, Controllers are only called
  // when they are recreated or on app start, instead of every page change.
  // To listen for when this page is active (for example, to refresh data),
  // listen for the $ionicView.enter event:
  //
  //$scope.$on('$ionicView.enter', function(e) {
  //});

  $scope.chats = Chats.all();
  $scope.remove = function(chat) {
    Chats.remove(chat);
  };
})

.controller('ChatDetailCtrl', function($scope, $stateParams, Chats) {
  $scope.chat = Chats.get($stateParams.chatId);
})

.controller('AccountCtrl', function($scope) {
  $scope.settings = {
    enableFriends: true
  };
});
