import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 1000
    height: 600
    visible: true
    title: qsTr("Hello World")
    property int numero: 0
    property int klikattu: 0
    Rectangle {
        property bool engineRunning: false
        id: dashboardBackgroud
        anchors.fill: parent
        color: "black"
        Tachometer{
            id: tachometer
            scale: 0
            rpm : 0
            Behavior on scale {
                PropertyAnimation {
                    easing.type: Easing.InCubic
                    duration: 2000
                }
            }
        }
        Speedometer{
            id: speedometer
            scale: 0
            x: 500
            Behavior on scale {
                PropertyAnimation {
                    easing.type: Easing.InCubic
                    duration: 2000
                }
            }
        }


            Image{
                id:valitsin
                width: 30
                height: 30
                source: "valkonen.png"
                scale: 0
                x: 475
                y:20

            }
            Image{
                id: drive
                x: 475
                y:80
                width: 30
                height: 30
                source: "LetterD.png"


               }
            Image {
                id: neutral
                x: 475
                y:20
                width: 30
                height: 30
                source: "LetterN.png"

            }
}
        Text{
            id:motorStatusText
            color: "#fffdfd"
            text: "Sammutettu"
            font.pointSize: 24
            anchors.horizontalCenter: parent.horizontalCenter
            Behavior on y {
                PropertyAnimation {
                    easing.type: Easing.InQuad
                    duration: 2000
                }
            }
        }

        Button {
            id: vaihdesilmä
            buttonText: numero
            scale: 0
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.bottom: parent.bottom
        }

        Button {
            id: vaihdekeppi
            buttonText: "Valitse vaihde"
            scale: 0
            anchors.left: parent.left
            anchors.leftMargin: 130
            anchors.bottom: parent.bottom
            onButtonClicked: {
                if(klikattu == 0){
                    klikattu +=1
                    numero +=1
                    valitsin.y = 80
                    }

                else{
                    klikattu -=1
                    numero = 0
                    valitsin.y = 20
                    speedometer.speed = 0
                    tachometer.rpm = 1000
                    }

                }
            }


        Button{
            id: kaasu
            buttonText: "Kaasu"
            backgroundColor: "White"
            scale: 0
            anchors.left: parent.left
            anchors.leftMargin: 395
            anchors.bottom: parent.bottom
            onButtonClicked: {
                if(numero != 0){
                if(tachometer.rpm < 8000){
                    if(tachometer.rpm  == 5000 && numero < 8){
                        tachometer.rpm -= 2000
                        numero +=1
                    }
                    else{
                      tachometer.rpm +=1000
                    }

                    if(speedometer.speed < 26000){
                        speedometer.speed +=1000

                    }
                    else{
                        speedometer.speed += 0
                    }
                }
                else{
                   tachometer.rpm += 0
                }
            }
            else{
            }
            }

        }



        Button{
            id: jarru
            buttonText: "Jarru"
            backgroundColor: "White"
            scale: 0
            anchors.left: kaasu.right;
            anchors.leftMargin: 10
            anchors.bottom: parent.bottom
            onButtonClicked: {
                if(numero != 0){
                if(speedometer.speed >0){
                    speedometer.speed -=1000
                    if(tachometer.rpm > 1000){
                        tachometer.rpm -= 1000
                    }
                    else{
                        tachometer.rpm -= 0
                    }
                    if(tachometer.rpm < 3000 && numero >1){
                        tachometer.rpm +=4000
                        numero -= 1
                    }
                    else{
                        tachometer.rpm -=0
                        numero -=0
                    }
                }
                else{
                    speedometer.speed -=0
                    tachometer.rpm = 1000
                    numero = 1
                }
            }
                else{

                }
            }
        }


        Button{
            buttonText: "Start/\Stop"
            backgroundColor: "lightgreen"
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            onButtonClicked: {
                if(dashboardBackgroud.engineRunning == false){
                    startEngine();
                }
                else{
                    stopEngine();
                }
            }
        }

    function startEngine(){
        motorStatusText.text = "Käynnistetty"
        motorStatusText.y = 450
        if(tachometer.rpm < 8000){
            tachometer.rpm +=1000
        }
        else{
           tachometer.rpm = 0
        }
        speedometer.scale = 1
        tachometer.scale = 1
        dashboardBackgroud.engineRunning = true;
        dashboardBackgroud.color = "blue"
        kaasu.scale = 1
        jarru.scale = 1
        vaihdesilmä.scale = 1
        valitsin.scale = 1
        neutral.scale = 1
        drive.scale = 1
        vaihdekeppi.scale = 1

    }

    function stopEngine(){
        speedometer.scale = 0
        tachometer.scale = 0
        dashboardBackgroud.engineRunning = false
        tachometer.rpm = 0
        speedometer.speed = 0
        motorStatusText.y = 0
        numero = 0
        motorStatusText.text = "Sammutettu"
        dashboardBackgroud.color = "black"
        kaasu.scale = 0
        jarru.scale = 0
        vaihdesilmä.scale = 0
        valitsin.scale = 0
        neutral.scale = 0
        drive.scale = 0
        vaihdekeppi.scale = 0

    }
}
