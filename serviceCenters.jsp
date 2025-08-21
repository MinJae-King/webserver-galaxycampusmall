<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="menu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/css/style.css">
<title>AS 가능 지점</title>
<script
  src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=a54251279804814b76533630ab8e0527"></script>
<style>
#map {
	width: 100%;
	height: 600px;
	margin-top: 10px;
}

.btn-group {
	text-align: center;
	margin: 15px 0;
}

.btn-group button {
	margin: 0 5px;
	padding: 8px 15px;
	font-size: 14px;
	cursor: pointer;
}
</style>
</head>
<body>
  <h2 style="text-align: center;">전국 AS 가능 지점</h2>

  <div class="btn-group">
    <button onclick="showMarkers('seoul')">서울만 보기</button>
    <button onclick="showMarkers('gyeonggi')">경기도만 보기</button>
  </div>

  <div id="map"></div>

  <script>
    var mapContainer = document.getElementById('map');
    var mapOption = {
      center: new kakao.maps.LatLng(37.4, 127.0), // 초기 지도 위치 설정
      level: 8
    };
    var map = new kakao.maps.Map(mapContainer, mapOption);
    var markers = [];

    const serviceCenters = {
      seoul: [
        { name: "강남 AS 센터", lat: 37.498095, lng: 127.027610 },
        { name: "용산 AS 센터", lat: 37.529659, lng: 126.964775 },
        { name: "신촌 AS 센터", lat: 37.556197, lng: 126.938720 },
        { name: "잠실 AS 센터", lat: 37.511337, lng: 127.096212 },
        { name: "은평 AS 센터", lat: 37.602000, lng: 126.929525 },
        { name: "구로 AS 센터", lat: 37.503551, lng: 126.882345 },
        { name: "노원 AS 센터", lat: 37.655349, lng: 127.077789 },
        { name: "동대문 AS 센터", lat: 37.574560, lng: 127.039630 },
        { name: "마포 AS 센터", lat: 37.549819, lng: 126.954092 },
        { name: "서초 AS 센터", lat: 37.484136, lng: 127.030336 }
      ],
      gyeonggi: [
        { name: "수원 AS 센터", lat: 37.263573, lng: 127.028601 },
        { name: "고양 AS 센터", lat: 37.658359, lng: 126.832020 },
        { name: "성남 AS 센터", lat: 37.420189, lng: 127.126299 },
        { name: "부천 AS 센터", lat: 37.504779, lng: 126.763088 },
        { name: "안양 AS 센터", lat: 37.390995, lng: 126.953280 },
        { name: "화성 AS 센터", lat: 37.199493, lng: 126.831187 },
        { name: "남양주 AS 센터", lat: 37.636752, lng: 127.216927 },
        { name: "의정부 AS 센터", lat: 37.738415, lng: 127.044374 },
        { name: "파주 AS 센터", lat: 37.759951, lng: 126.779644 },
        { name: "광명 AS 센터", lat: 37.477102, lng: 126.864308 }
      ]
    };

    function showMarkers(region) {
      // 기존 마커 제거
      markers.forEach(m => m.setMap(null));
      markers = [];

      serviceCenters[region].forEach(center => {
        const marker = new kakao.maps.Marker({
          map: map,
          position: new kakao.maps.LatLng(center.lat, center.lng)
        });

        const infowindow = new kakao.maps.InfoWindow({
          content: '<div style="padding:5px;">' + center.name + '</div>'
        });

        kakao.maps.event.addListener(marker, 'click', function () {
          infowindow.open(map, marker);
        });

        markers.push(marker);
      });
    }

    // 초기 상태는 서울로 표시
    showMarkers('seoul');
  </script>
</body>
</html>
