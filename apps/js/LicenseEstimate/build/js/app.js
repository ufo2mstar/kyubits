angular.module('estimator', ['estimate.directives'])
    .controller('EstimateController', function ($scope) {
        $scope.tables = 1;
        $scope.complexity = 1;
        $scope.datasize = 1;
        $scope.disc = 0;

        $scope.complexitySlider = 3;
        $scope.complexitySlider = function (value) {
            complexityvalues = {1: 1, 2: 1.5, 3: 2, 4: 2.5, 5: 3};
            $scope.complexity = complexityvalues[value.from];
            console.log("complexity slider update " + $scope.complexity);
            $scope.compute();
            $scope.$apply()
        };
        $scope.tablesSlider = function (value) {
            $scope.tables = value.from;
            console.log("tables slider update " + $scope.tables);
            $scope.compute();
            $scope.$apply()
        };
        $scope.dataSlider = function (value) {
            $scope.datasize = value.from;
            console.log("datasize slider update " + $scope.datasize);
            $scope.compute();
            $scope.$apply()
        };


        $scope.compute = function () {
            if ($scope.tables <= 100) {
                Tablepricing = $scope.tables * 25
            } else if ($scope.tables <= 500) {
                Tablepricing1 = 100 * 25;
                Tablepricing2 = ($scope.tables - 100) * 4;
                Tablepricing = Tablepricing1 + Tablepricing2
            } else if ($scope.tables <= 1000) {
                Tablepricing1 = 100 * 25;
                Tablepricing2 = 400 * 4;
                Tablepricing3 = ($scope.tables - 500) * 3;
                Tablepricing = Tablepricing1 + Tablepricing2 + Tablepricing3
            } else if ($scope.tables <= 5000) {
                Tablepricing1 = 100 * 25;
                Tablepricing2 = 400 * 4;
                Tablepricing3 = 500 * 3;
                Tablepricing4 = ($scope.tables - 1000) * 2.5;
                Tablepricing = Tablepricing1 + Tablepricing2 + Tablepricing3 + Tablepricing4
            } else if ($scope.tables <= 10000) {
                Tablepricing1 = 100 * 25;
                Tablepricing2 = 400 * 4;
                Tablepricing3 = 500 * 3;
                Tablepricing4 = 4000 * 2.5;
                Tablepricing5 = ($scope.tables - 5000) * 2;
                Tablepricing = Tablepricing1 + Tablepricing2 + Tablepricing3 + Tablepricing4 + Tablepricing5
            }
            if ($scope.datasize <= 100) {
                Datapricing = $scope.datasize * 25
            } else if ($scope.datasize <= 250) {
                Datapricing1 = 100 * 25;
                Datapricing2 = ($scope.datasize - 100) * 4;
                Datapricing = Datapricing1 + Datapricing2
            } else if ($scope.datasize <= 500) {
                Datapricing1 = 100 * 25;
                Datapricing2 = 150 * 4;
                Datapricing3 = ($scope.datasize - 250) * 3;
                Datapricing = Datapricing1 + Datapricing2 + Datapricing3
            } else if ($scope.datasize <= 1000) {
                Datapricing1 = 100 * 25;
                Datapricing2 = 150 * 4;
                Datapricing3 = 250 * 3;
                Datapricing4 = ($scope.datasize - 500) * 2;
                Datapricing = Datapricing1 + Datapricing2 + Datapricing3 + Datapricing4
            } else if ($scope.datasize <= 5000) {
                Datapricing1 = 100 * 25;
                Datapricing2 = 150 * 4;
                Datapricing3 = 250 * 3;
                Datapricing4 = 500 * 2;
                Datapricing5 = ($scope.datasize - 1000) * 1;
                Datapricing = Datapricing1 + Datapricing2 + Datapricing3 + Datapricing4 + Datapricing5
            }
            estimate = (Tablepricing + Datapricing) * $scope.complexity;
            if (estimate < 5000) {
                estimate = 5000
            } else if (estimate > 100000) {
                estimate = 100000
            } else {
                estimate = estimate
            }
            // totalEstimate = totalEstimate + estimate;
            // showTotal();
            return estimate
        };

        $scope.computedisc = function () {
            discestimate = estimate - estimate * ($scope.disc / 100);
            return discestimate
        };

        $('#addApp').on('click', function () {
            // $scope.complexitySlider.update({from: 3});
            // $scope.complexitySlider.data('ionRangeSlider').update({from: 3});
            $("#complexity").data('ionRangeSlider').update({from: 1});
            $("#tables").data('ionRangeSlider').update({from: 1});
            $("#datasize").data('ionRangeSlider').update({from: 1});
            showTotal();
            $scope.$apply()
        });

        // var $scope.totalEstimate = 0;
        $scope.totalEstimate = 0;
        // $scope.showTotal = function showTotal() {
        function showTotal() {
            $scope.totalEstimate = $scope.totalEstimate + estimate;
            // $scope.totalEstimate =  estimate;
            // totalEstimate
        };

        $scope.complexitySliderdesc = function () {
            if ($scope.complexity == 1) {
                complexitySliderdesc = "Small apps up to 20 users, Structured DB"
            } else if ($scope.complexity == 1.5) {
                complexitySliderdesc = "Small apps with 20 to 50 users, Structured DB and Unstructured DB"
            } else if ($scope.complexity == 2) {
                complexitySliderdesc = "Medium apps with up to 200 users, Structured DB and Unstructured DB"
            } else if ($scope.complexity == 2.5) {
                complexitySliderdesc = "Medium apps with up to 200 users, ERP & Product based DBs"
            } else if ($scope.complexity == 3) {
                complexitySliderdesc = "Large apps with 200+ users, ERP/Product based DBs, AS 400 like systems"
            } else {
                complexitySliderdesc = "No Complexity"
            }
            return complexitySliderdesc
        }
    });
