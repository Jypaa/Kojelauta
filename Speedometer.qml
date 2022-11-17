import QtQuick 2.15

Item {
    property int speed: 0
    Image {
        width: 500
        height: 500
        source: "speedo.png"
        Image{
            id :blue
            height: parent.height *0.33
            source: "needleblue.png"
            anchors.centerIn: parent
            anchors.verticalCenterOffset: -0.5 * height
            rotation: -135 + speed / 1000 * 10.5//21
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
