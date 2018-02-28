$(document).ready(function() {
    
    // prepare the data
            var source =
            {
                datatype: "json",
                datafields : [ {
			name : 'height',
			type : 'int',
			map : 'height'
		}, {
			name : 'difficulty',
			type : 'int',
			map : 'difficulty'
		}, {
			name : 'reward',
			type : 'string',
			map : 'reward'
		} ],
		id : 'id',
                url: '/tychexplore/getRecentBlocks'
            };
            var dataAdapter = new $.jqx.dataAdapter(source, { async: false, autoBind: true, loadError: function (xhr, status, error) { alert('Error loading "' + source.url + '" : ' + error); } });
               
            // prepare jqxChart settings
            var settings = {
                title: "U.S. History Home Prices (1950-2017)",
                description: "Source: http://www.econ.yale.edu/~shiller/data.htm",
                enableAnimations: true,
                showLegend: true,
                padding: { left: 15, top: 5, right: 20, bottom: 5 },
                titlePadding: { left: 10, top: 0, right: 0, bottom: 10 },
                source: dataAdapter,
                xAxis:
                    {
                        dataField: 'Year',
                        minValue: 1950,
                        maxValue: 2017,
                        unitInterval: 5,
                        valuesOnTicks: true
                    },
                colorScheme: 'scheme05',
                seriesGroups:
                    [
                        {
                            alignEndPointsWithIntervals: false,
                            type: 'splinearea',
                            valueAxis:
                            {
                                visible: true,
                                unitInterval: 20,
                                title: {text: 'Index Value'},
                                labels: {
                                    horizontalAlignment: 'right',
                                    formatSettings: {decimalPlaces: 0}
                                }
                            },
                            series: [
                                    { dataField: 'HPI', displayText: 'Real Home Price Index', opacity: 0.7 },
                                    { dataField: 'BuildCost', displayText: 'Building Cost Index', opacity: 0.9 }
                                ]
                        },
                        {
                            type: 'spline',
                            alignEndPointsWithIntervals: false,
                            valueAxis:
                            {
                                title: {text: 'Interest Rate'},
                                position: 'right',
                                unitInterval: 0.01,
                                maxValue: 0.2,
                                labels: {formatSettings: { decimalPlaces: 2}},
                                tickMarks: {
                                    visible: true,
                                    interval: 0.005,
                                },
                                gridLines: {
                                    visible: false,
                                    interval: 0.01
                                }
                            },
                            series: [
                                    { dataField: 'Rate', displayText: 'Interest Rate', opacity: 1.0, lineWidth: 4, dashStyle: '4,4' }
                                ]
                        }
                    ]
            };
            // setup the chart
            $('#chartContainer').jqxChart(settings);

	var url = "/tychexplore/getRecentBlocks";
	// prepare the data
	var source = {
		datatype : "json",
		datafields : [ {
			name : 'height',
			type : 'int',
			map : 'height'
		}, {
			name : 'hash',
			type : 'string',
			map : 'hash'
		}, {
			name : 'difficulty',
			type : 'int',
			map : 'difficulty'
		}, {
			name : 'reward',
			type : 'string',
			map : 'reward'
		}, {
			name : 'orphan_status',
			type : 'string',
			map : 'orphan_status'
		} ],
		id : 'id',
		url : url,
		root : 'blockHeaders',
		beforeSend : function(data) {
			$.ajax({
				type : "GET",
				contentType : "application/json",
				url : "/tychexplore/getTotalPages",
				dataType : 'json',
				success : function(data) {
					source.totalrecords = data;
				},
				error : function(e) {
					console.log("ERROR: ", e);
				}
			});
		}
	};

	var dataAdapter = new $.jqx.dataAdapter(source);

	$("#table").jqxDataTable({
		width : "100%",
		autoRowHeight : true,
		theme : 'darkblue',
		source : dataAdapter,
		filterable : false,
		pagerPosition : 'both',
		pageable : true,
		pagerMode : "advanced",
		pageSizeOptions : [ '10', '15', '20' ],
		pagerButtonsCount : 5,
		serverProcessing : true,
		altRows : true,
		columns : [ {
			text : 'Height',
			editable : false,
			dataField : 'height',
			width : '15%'
		}, {
			text : 'Block Hash',
			editable : false,
			dataField : 'hash',
			width : '45%'
		}, {
			text : 'difficulty',
			editable : false,
			dataField : 'difficulty',
			width : '15%'
		}, {
			text : 'reward',
			dataField : 'reward',
			width : '15%',
			cellsalign : 'right'
		}, {
			text : 'orphan_status',
			dataField : 'orphan_status',
			cellsalign : 'center',
			width : '10%'
		} ]
	});

});