(() => {
if (navigator.geolocation)
{
    navigator.geolocation.getCurrentPosition(

        function( position ) {
            alert ("位置情報サービスを利用します。")
            //緯度の取得
            const latitudeValue = position.coords.latitude;
            //経度の取得
            const longitudeValue = position.coords.longitude;
            //値の受け渡し
            document.getElementById("latitudeValue").value = latitudeValue;
            document.getElementById("longitudeValue").value = longitudeValue;

            console.log(latitudeValue);
        }
    )
}

else {
    alert("申し訳ありませんが、あなたの端末では位置情報サービスを利用できません。")
}
})();