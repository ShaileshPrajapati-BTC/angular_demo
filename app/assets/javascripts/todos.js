(function() {
    app=angular.module('Todo', [])
    app.controller('TodoController', function($scope,$http) {
    
        $scope.entries = [];

       
   		 $scope.init=function()
   		 {
   		 $http.get('/show', {responseType:'json'}).success(function(data){
   		 $scope.entries = data;
   		// alert(data);
   		 });
   		 };

        $scope.addEntry=function(name1){
        var data = {name: name1}
         $http.post('/todos', data).success(function(data){
   		 $scope.entries = data;
   		 });
        };
        
        $scope.removeEntry=function(id){
         $http.delete('/todos/'+id).success(function(data){
   		 $scope.entries = data;
   		 });
        };
    });
    
}());