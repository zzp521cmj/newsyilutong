window.onload=function(){
	var oneid = 0;
	var twoid = 0;
	var oneid1 = 0;
	var twoid1 = 0;
	$('#province').combobox(
			{
				url : 'company.do?method=getNewFinalPositionCounty',
				valueField : 'id',
				textField : 'text',
				width : 120,
				editable : false,
				onSelect : function(record) {
					oneid = record.citye_parent_id;
					$('#city').combobox("clear");
					$('#county').combotree("clear");
					$('#city').combobox(
							'reload',
							'company.do?method=getNewFinalpositionCity&&citye_parent_id='
									+ oneid);
					$('#county').combotree('reload',
							'company.do?method=getNewFinalPositionCounty');
				}
			});
	$('#city')
			.combobox(
					{
						url : 'company.do?method=getNewFinalpositionCity&&citye_parent_id='
								+ oneid,
						valueField : 'id',
						width : 120,
						textField : 'text',
						editable : false,
						onSelect : function(record) {
							twoid = record.citye_parent_id;
							$('#county').combotree("clear");
							$('#county').combotree(
									'reload',
									'company.do?method=getNewFinalpositionCounty&&citye_parent_id='
											+ twoid);
						}
					});
	$('#county')
			.combotree(
					{
						multiple : false,
						url : 'company.do?method=getNewFinalpositionCounty&&citye_parent_id='
								+ twoid,

					});

});


$('#province1').combobox(
		{
			url : 'company.do?method=getNewFinalPositionCounty',
			valueField : 'id',
			textField : 'text',
			width : 120,
			editable : false,
			onSelect : function(record) {
				oneid1 = record.citye_parent_id;
				$('#city').combobox("clear");
				$('#county').combotree("clear");
				$('#city').combobox(
						'reload',
						'company.do?method=getNewFinalpositionCity&&citye_parent_id='
								+ oneid1);
				$('#county').combotree('reload',
						'company.do?method=getNewFinalPositionCounty');
			}
		});
$('#city1')
		.combobox(
				{
					url : 'company.do?method=getNewFinalpositionCity&&citye_parent_id='
							+ oneid1,
					valueField : 'id',
					width : 120,
					textField : 'text',
					editable : false,
					onSelect : function(record) {
						twoid1 = record.citye_parent_id;
						$('#county').combotree("clear");
						$('#county').combotree(
								'reload',
								'company.do?method=getNewFinalpositionCounty&&citye_parent_id='
										+ twoid1);
					}
				});
$('#county1')
		.combotree(
				{
					multiple : false,
					url : 'company.do?method=getNewFinalpositionCounty&&citye_parent_id='
							+ twoid1,

				});

});
}