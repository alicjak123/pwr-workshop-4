angular.module('DigApp').controller 'DigCtrl', ($scope, Dig, dig, comments) ->
	$scope.dig = dig.data
	$scope.comments = comments.data

	
