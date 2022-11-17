import QtQuick 2.15

Item{
    property int rpm: 0
    Image {
        width: 500
        height:500
        source: "tacho.png"
        Image {
            id: red
            height: parent.height * 0.3
            source: "needlered.png"
            anchors.centerIn: parent
            anchors.verticalCenterOffset: -0.5 * height
            rotation: -120 + rpm / 1000 * 30
            transformOrigin: Item.Bottom
            Behavior on rotation {
                PropertyAnimation {
                    easing.type: Easing.OutQuad
                    duration: 1000
                }
            }
        }
    }
}

