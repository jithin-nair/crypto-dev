$(document).ready(
		function() {
			
			
			var url = "../sampledata/beverages.txt";
            // prepare the data
            var source =
            {
                datatype: "json",
                datafields: [
                    { name: 'name', type: 'string' },
                    { name: 'type', type: 'string' },
                    { name: 'calories', type: 'int' },
                    { name: 'totalfat', type: 'string' },
                    { name: 'protein', type: 'string' }
                ],
                id: 'id',
                url: url
            };
       
			var dataAdapter = new $.jqx.dataAdapter(source);
			
			$("#table").jqxDataTable({
				width : getWidth("dataTable"),
				source : dataAdapter,
				pagerPosition : 'both',
				pageable : true,
				altRows : true,
				columns : [ {
					text : 'Name',
					dataField : 'firstname',
					width : 200
				}, {
					text : 'Last Name',
					dataField : 'lastname',
					width : 200
				}, {
					text : 'Product',
					editable : false,
					dataField : 'productname',
					width : 180
				}, {
					text : 'Quantity',
					dataField : 'quantity',
					width : 80,
					cellsalign : 'right'
				}, {
					text : 'Unit Price',
					dataField : 'price',
					width : 80,
					cellsalign : 'right',
					cellsFormat : 'c2'
				}, {
					text : 'Total',
					dataField : 'total',
					cellsalign : 'right',
					cellsFormat : 'c2'
				} ]
			});

		});