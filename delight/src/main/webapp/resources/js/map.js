/*
*
*공연 위치 정보에 사용되는 지도 API의 javascript 기능
* 
*/


    var mapContainer = document.getElementById('map');
    var mapOption = {
        
            center: new kakao.maps.LatLng(37.61892662, 126.7201521),
        
        level: 3
    };
    
    // 지도를 생성한다
        var map = new kakao.maps.Map(mapContainer, mapOption);
        map.setZoomable(false)
        var markerPosition  = new kakao.maps.LatLng(37.61892662, 126.7201521);
        var marker = new kakao.maps.Marker({
            position: markerPosition
        });
        marker.setMap(map);
    

    var $mySightContainer = $("#mySight-list");
    var $mySightPagingContainer = $("#mySight-page-list");
    var $performanceContainer = $("#performance-list");
    var $performancePagingContainer = $("#performance-page-list");
    var $exhibitionContainer = $("#exhibition-list");
    var $exhibitionPagingContainer = $("#exhibition-page-list");
    observableMap.observe(function(change) {
        if (change.name == 'mySights'){
            var $item = $(mySightTemplate({mySights: observableMap.get('mySights')}));
            $mySightContainer.html($item)
        }else if (change.name == 'exhibitionProducts') {
            var exhibitionProducts = observableMap.get('exhibitionProducts');
            if (_.values(mobx.toJS(exhibitionProducts)).length > 0) {
                var $item = $(productTemplate({products: exhibitionProducts}));
                $exhibitionContainer.html($item)
            }else{
                $exhibitionContainer.html('<td colspan="3">장소의 다른 전시가 없습니다.</td>');
            }
        }else if (change.name == 'performanceProducts') {
            var performanceProducts = observableMap.get('performanceProducts');
            if (_.values(mobx.toJS(performanceProducts)).length > 0) {
                var $item = $(productTemplate({products: performanceProducts}));
                $performanceContainer.html($item);
            }else{
                $performanceContainer.html('<td colspan="3">장소의 다른 공연이 없습니다.</td>')
            }
        }else if(change.name == 'mySightSearchParam'){
            var $item = $(mySightPagingTemplate(change.newValue));
            $mySightPagingContainer.html($item)
        }else if(change.name == 'exhibitionProductSearchParam'){
            var $item = $(exhibitionProductPagingTemplate(change.newValue));
            $exhibitionPagingContainer.html($item)
        }else if(change.name == 'performanceProductSearchParam'){
            var $item = $(performanceProductPagingTemplate(change.newValue));
            $performancePagingContainer.html($item)
        }
    }, true);

    var mySightTemplate =
        _.template(
            '<@ _.each(mySights,function(mySight){@>'+
            '   <tr>' +
            '       <td><a href="<@=mySight.link@>" target="blank"><@=mySight.title@></a></td>' +
            '       <td><@=mySight.addr1@> <@=mySight.addr2@></td>' +
            '       <td><@=mySight.phone1@></td>'+
            '   </tr>'+
            '<@});@>');

    var mySightPagingTemplate =
        _.template(
            '<@if(pagingStart >1){@>'+
            '   <span class="btn img_ty first" onclick="getMySights(1);">FIRST</span>'+
            '   <span class="btn img_ty pre" onclick="getMySights(<@=pagingStart - pagingBlock@>);">PRE</span>'+
            '<@}@>'+
            '<@for(var i = pagingStart;i <= pagingEnd; i++){@>'+
            '   <@if(pageNo == i){@>'+
            '       <span class="btn num on" onclick="getMySights(<@=i@>);"><@=i@></span>'+
            '   <@}else{@>'+
            '       <span class="btn num" onclick="getMySights(<@=i@>);"><@=i@></span>'+
            '   <@}@>'+
            '<@}@>'+
            '<@if(pagingEnd < maxPage ){@>'+
            '   <span class="btn img_ty next" onclick="getMySights(<@=pagingEnd + 1@>);">NEXT</span>'+
            '   <span class="btn img_ty last" onclick="getMySights(<@=maxPage@>);">LAST</span>'+
            '<@}@>'
        );

    var productTemplate =
        _.template(
            '<@ _.each(products,function(product){@>'+
            '   <tr>' +
            '       <td><a href="/ticket/product/detail/<@=product.id@>"><@=product.name@></a></td>' +
            '       <td>'+
            '           <@=moment(product.openDate.from).format("YYYY.MM.DD")@> ' +
            '           <@ if(!product.isOpenRun){@>' +
            '               ~ <@=moment(product.openDate.to).format("YYYY.MM.DD")@> ' +
            '           <@}@>' +
            '           <@ if(product.isOpenRun){@>' +
            '               오픈런+' +
            '           <@}@>'+
            '       </td>'+
            '   </tr>'+
            '<@});@>');

    var performanceProductPagingTemplate =
        _.template(
            '<@if(pagingStart >1){@>'+
            '   <span class="btn img_ty first" onclick="getPerformanceProductList(1);">FIRST</span>'+
            '   <span class="btn img_ty pre" onclick="getPerformanceProductList(<@=pagingStart - pagingBlock@>);">PRE</span>'+
            '<@}@>'+
            '<@for(var i = pagingStart;i <= pagingEnd; i++){@>'+
            '   <@if(pageNo == i){@>'+
            '       <span class="btn num on" onclick="getPerformanceProductList(<@=i@>);"><@=i@></span>'+
            '   <@}else{@>'+
            '       <span class="btn num" onclick="getPerformanceProductList(<@=i@>);"><@=i@></span>'+
            '   <@}@>'+
            '<@}@>'+
            '<@if(pagingEnd < maxPage ){@>'+
            '   <span class="btn img_ty next" onclick="getPerformanceProductList(<@=pagingEnd + 1@>);">NEXT</span>'+
            '   <span class="btn img_ty last" onclick="getPerformanceProductList(<@=maxPage@>);">LAST</span>'+
            '<@}@>'
        );

    var exhibitionProductPagingTemplate =
        _.template(
            '<@if(pagingStart >1){@>'+
            '   <span class="btn img_ty first" onclick="getExhibitionProductList(1);">FIRST</span>'+
            '   <span class="btn img_ty pre" onclick="getExhibitionProductList(<@=pagingStart - pagingBlock@>);">PRE</span>'+
            '<@}@>'+
            '<@for(var i = pagingStart;i <= pagingEnd; i++){@>'+
            '   <@if(pageNo == i){@>'+
            '       <span class="btn num on" onclick="getExhibitionProductList(<@=i@>);"><@=i@></span>'+
            '   <@}else{@>'+
            '       <span class="btn num" onclick="getExhibitionProductList(<@=i@>);"><@=i@></span>'+
            '   <@}@>'+
            '<@}@>'+
            '<@if(pagingEnd < maxPage ){@>'+
            '   <span class="btn img_ty next" onclick="getExhibitionProductList(<@=pagingEnd + 1@>);">NEXT</span>'+
            '   <span class="btn img_ty last" onclick="getExhibitionProductList(<@=maxPage@>);">LAST</span>'+
            '<@}@>'
        );

    function getMySights(pageNo){
        
        $.ajax({
            url : '/ticket/facility/mySight/list',
            type : 'POST',
            contentType : 'application/json',
            async : true,
            success : function(result) {
                var mySightMap ={};
                _.each(result.mySights,function(mySight){
                    return mySightMap[mySight.id] = mySight;
                })
                observableMap.set('mySights',mySightMap);
                observableMap.set('mySightSearchParam',result.searchParam);
            },
            data : JSON.stringify({
                pageNo : pageNo,
                mainAddress : '경기도 김포시',

            }),
            dataType : 'json',
        });
    }
    function getExhibitionProductList(pageNo){
        $.ajax({
            url : '/ticket/facility/exhibition/product/list',
            type : 'POST',
            contentType : 'application/json',
            async : true,
            success : function(result) {
                var exhibitionProductMap ={};
                _.each(result.products,function(product){
                    return exhibitionProductMap[product.id] = product;
                })
                observableMap.set('exhibitionProducts',exhibitionProductMap);
                observableMap.set('exhibitionProductSearchParam',result.searchParam);
            },
            data : JSON.stringify({
                pageNo : pageNo,
                facilityId : '4764',
                exceptProductId : 'PR005011'
            }),
            dataType : 'json',
        });
    }
    function getPerformanceProductList(pageNo){
        $.ajax({
            url : '/ticket/facility/performance/product/list',
            type : 'POST',
            contentType : 'application/json',
            async : true,
            success : function(result) {
                var performanceProductMap ={};
                _.each(result.products,function(product){
                    return performanceProductMap[product.id] = product;
                })
                observableMap.set('performanceProducts',performanceProductMap);
                observableMap.set('performanceProductSearchParam',result.searchParam);
            },
            data : JSON.stringify({
                pageNo : pageNo,
                facilityId : '4764',
                exceptProductId : 'PR005011'
            }),
            dataType : 'json',
        });
    }
    $(function(){
        
            // getMySights(1);
        getPerformanceProductList(1);
    });
 