var app = angular.module('shop', []);

$(document).on('ready page:load', function(){
  angular.bootstrap(document.body, ['shop'])
});

app.factory('models', [function(){
  var x = {
    orders: []
  };
  return x;
}]);

app.controller('OrdersCntrl', ['$scope', 'models', function($scope, models){
  //here is all the code for this controller
  $scope.orders = models.orders.query();
  $scope.products = models.products.query();
  
  $scope.addOrder = function(){
    if(!$scope.newOrder.product_id || $scope.newOrder.total === ''){ return; }
    order = models.orders.save($scope.newOrder, function(){
      recent_order = models.orders.get({id: order.id});
      $scope.orders.push(recent_order);
      $scope.newOrder = '';
  });
    
  
};
  
  $scope.deleteOrder = function(order){
    $scope.orders.splice($scope.orders.indexOf(order), 1);
    models.orders.delete(order);
  };
}]);