angular.module('estimate.directives', [])
.directive('ionSlider',function($timeout){
    return{
        restrict:'EC',
        scope:{
            min:'=',
            max:'=',
            type:'@',
            prefix:'@',
            maxPostfix:'@',
            prettify:'@',
            grid:'@',
            gridMargin:'@',
            postfix:'@',
            step:'@',
            hideMinMax:'@',
            hideFromTo:'@',
            from:'=',
            disable:'=',
            onChange:'=',
            onFinish:'=',
            onStart:'=',
            onUpdate:'='
        },
        template:'<input>',
        replace:true,
        link:function($scope,element,attrs){
            angular.element(document).ready(function (){
                $(element).ionRangeSlider({
                    min: $scope.min,
                    max: $scope.max,
                    type: $scope.type,
                    prefix: $scope.prefix,
                    maxPostfix: $scope.maxPostfix,
                    prettify: $scope.prettify,
                    grid: $scope.grid,
                    gridMargin: $scope.gridMargin,
                    postfix:$scope.postfix,
                    step:$scope.step,
                    hideMinMax:$scope.hideMinMax,
                    hideFromTo:$scope.hideFromTo,
                    from:$scope.from,
                    disable:$scope.disable,
                    onChange:$scope.onChange,
                    onFinish:$scope.onFinish,
                    onStart:$scope.onStart,
                    onUpdate:$scope.onUpdate
                });
            });
        }
    }
})