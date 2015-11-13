angular.module('starter.controllers', [])

.controller('DashCtrl', function($scope, Chargers) {
  Chargers.query().$promise.then(function(response){
    $scope.chargers = response;
  });
})

.controller('LendCtrl', function($scope) {
  $scope.settings = {
    enableLending: true
  };
})

.controller('AccountCtrl', function($scope) {
  $scope.settings = {
    enableFriends: true
  };
});
