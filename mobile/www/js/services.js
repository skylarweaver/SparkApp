angular.module('starter.services', [])


.factory('Owned_Devices', function ($resource) {
  return $resource("http://localhost:3000/owned_devices/:id.json", 
    {id: '@id'}, 
    {update: {method:'PUT'} }
    );
})

.factory('Users_By_Charger', function ($resource) {
  return $resource("http://localhost:3000/usersByCharger/:id.json");
})

.factory('Chargers', function ($resource) {
  return $resource("http://localhost:3000/chargers/:id.json");
})

.factory('Devices', function ($resource) {
  return $resource("http://localhost:3000/devices/:id.json");
})

.factory('Transactions', function ($resource) {
  return $resource("http://localhost:3000/transactions/:id.json");
})

.factory('Requested_Transactions', function ($resource) {
  return $resource("http://localhost:3000/requestedTransactions/:id.json");
})

.factory('Past_Transactions', function ($resource) {
  return $resource("http://localhost:3000/pastTransactions/:id.json");
})

.factory('Current_Transactions', function ($resource) {
  return $resource("http://localhost:3000/currentTransactions/:id.json");
})

.factory('Login', function ($resource) {
  return $resource("http://localhost:3000/users/sign_in.json");
})

.factory('Logout', function ($resource) {
  return $resource("http://localhost:3000/users/sign_out.json");
})

.factory('Register', function ($resource) {
  return $resource("http://localhost:3000/users.json");
})

.factory('Users', function ($resource){
  return $resource("http://localhost:3000/users/:id.json");
})

// .factory('UpdateUsers', function ($resource){
//   return $resource("http://localhost:3000/updateuser/:id.json", {
//     id: '@userScopeId'
//   });
// })

.factory('UpdateUsers', function ($resource) {
    return $resource('http://localhost:3000/updateuser/:id.json',
    {id: '@id'}, 
    {update: {method:'PUT'} }
    );
  })

.factory('UpdateTransactions', function ($resource) {
    return $resource('http://localhost:3000/transactions/:id.json',
    {id: '@id'}, 
    {update: {method:'PUT'} }
    );
  })

.factory('Auth',function($window){
  return {
    set: function(data) {
      $window.localStorage['userToken'] = data.user_token;
      $window.localStorage['userEmail'] = data.user_email;
      $window.localStorage['userFirstName'] = data.first_name;
      $window.localStorage['userId'] = data.id;
    },
    get: function() {
      return { user_email: $window.localStorage['userEmail'],
               user_token: $window.localStorage['userToken'],
              first_name: $window.localStorage['userFirstName'],
              id: $window.localStorage['userId']};
    }
  }
})





//*****  DEFAULT IONIC STUFF BELOW  *****



.factory('Chats', function() {
  // Might use a resource here that returns a JSON array

  // Some fake testing data
  var chats = [{
    id: 0,
    name: 'Ben Sparrow',
    lastText: 'You on your way?',
    face: 'https://pbs.twimg.com/profile_images/514549811765211136/9SgAuHeY.png'
  }, {
    id: 1,
    name: 'Max Lynx',
    lastText: 'Hey, it\'s me',
    face: 'https://avatars3.githubusercontent.com/u/11214?v=3&s=460'
  }, {
    id: 2,
    name: 'Adam Bradleyson',
    lastText: 'I should buy a boat',
    face: 'https://pbs.twimg.com/profile_images/479090794058379264/84TKj_qa.jpeg'
  }, {
    id: 3,
    name: 'Perry Governor',
    lastText: 'Look at my mukluks!',
    face: 'https://pbs.twimg.com/profile_images/598205061232103424/3j5HUXMY.png'
  }, {
    id: 4,
    name: 'Mike Harrington',
    lastText: 'This is wicked good ice cream.',
    face: 'https://pbs.twimg.com/profile_images/578237281384841216/R3ae1n61.png'
  }];

  return {
    all: function() {
      return chats;
    },
    remove: function(chat) {
      chats.splice(chats.indexOf(chat), 1);
    },
    get: function(chatId) {
      for (var i = 0; i < chats.length; i++) {
        if (chats[i].id === parseInt(chatId)) {
          return chats[i];
        }
      }
      return null;
    }
  };
});
