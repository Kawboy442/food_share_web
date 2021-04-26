// マップ表示、検索機能: https://qiita.com/yoshi_yast/items/521c1f36306a180f45dd
// 現在地表示: https://qiita.com/akkey2475/items/29a5e5ab0e0ca04f4169

var map;
var marker;
var infoWindow;

function initMap() {
    // Geolocation APIに対応している
    if (navigator.geolocation) {
        // 現在地を取得
        navigator.geolocation.getCurrentPosition(
            // 取得成功した場合
            function(position) {
                // マップ初期表示の位置設定
                var target = document.getElementById("mapPreview");
                // 緯度・経度を変数に格納
                var mapLatLng = new google.maps.LatLng(
                    position.coords.latitude,
                    position.coords.longitude
                );

                // マップ表示
                map = new google.maps.Map(target, {
                    center: mapLatLng,
                    zoom: 15,
                });

                // マップにマーカーを表示する
                var marker = new google.maps.Marker({
                    map: map, // 対象の地図オブジェクト
                    position: mapLatLng, // 緯度・経度
                });
                // 結果クリアーボタン押下時
                document.getElementById("clear").addEventListener("click", function() {
                    deleteMakers();
                });
            },
            // 取得失敗した場合
            function(error) {
                // エラーメッセージを表示
                switch (error.code) {
                    case 1: // PERMISSION_DENIED
                        alert("位置情報の利用が許可されていません");
                        break;
                    case 2: // POSITION_UNAVAILABLE
                        alert("現在位置が取得できませんでした");
                        break;
                    case 3: // TIMEOUT
                        alert("タイムアウトになりました");
                        break;
                    default:
                        alert("その他のエラー(エラーコード:" + error.code + ")");
                        break;
                }
            }
        );
    } else {
        alert("この端末では位置情報が取得できません");
    }
}

function searchMap() {
    var place = document.getElementById("placeKeyword").value;
    var geocoder = new google.maps.Geocoder(); // geocoderのコンストラクタ

    geocoder.geocode({
            address: place,
        },
        function(results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                var bounds = new google.maps.LatLngBounds();

                for (var i in results) {
                    if (results[0].geometry) {
                        // 緯度経度を取得
                        var latlng = results[0].geometry.location;
                        // 住所を取得
                        var address = results[0].formatted_address;
                        // 検索結果地が含まれるように範囲を拡大
                        bounds.extend(latlng);
                        // マーカーのセット
                        setMarker(latlng);
                        // マーカーへの吹き出しの追加
                        setInfoW(place, latlng, address);
                        // マーカーにクリックイベントを追加
                        markerEvent();
                    }
                }
            } else if (status == google.maps.GeocoderStatus.ZERO_RESULTS) {
                alert("見つかりません");
            } else {
                console.log(status);
                alert("エラー発生");
            }
        }
    );
}

// マーカーのセットを実施する
function setMarker(setplace) {
    // 既にあるマーカーを削除
    deleteMakers();

    var iconUrl = "http://maps.google.com/mapfiles/ms/icons/blue-dot.png";
    marker = new google.maps.Marker({
        position: setplace,
        map: map,
        icon: iconUrl,
    });
}

//マーカーを削除する
function deleteMakers() {
    if (marker != null) {
        marker.setMap(null);
    }
    marker = null;
}

// マーカーへの吹き出しの追加
function setInfoW(place, latlng, address) {
    infoWindow = new google.maps.InfoWindow({
        content: "<a href='http://www.google.com/search?q=" +
            place +
            "' target='_blank'>" +
            place +
            "</a><br><br>" +
            latlng +
            "<br><br>" +
            address +
            "<br><br><a href='http://www.google.com/search?q=" +
            place +
            "&tbm=isch' target='_blank'>画像検索 by google</a>",
    });
}

// クリックイベント
function markerEvent() {
    marker.addListener("click", function() {
        infoWindow.open(map, marker);
    });
}