var app = angular.module('shop', []);

$(document).on('ready page:load', function() {
  angular.bootstrap(document.body, ['shop'])
});

app.controller('OrdersCtrl', ['$scope', function($scope){
  // Here will be all code belonging to this controller

}]);