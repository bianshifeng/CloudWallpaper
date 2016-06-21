import QtQuick 2.4
import "../UIKit/CloudUI/window"
import "../UIKit/CloudUI/controls"


ApplicationWindow{
    id: id_root
    title: "Material for QtQuick Demo"
    visible: true

    theme{
        primaryColor: "blue"
        accentColor: "red"
        tabHighlightColor: "white"
    }

    property var styles:["Custom Icons","Color Palette","Typography"]

    property var basicComponents:[
        "Button", "CheckBox", "Progress Bar", "Radio Button",
        "Slider", "Switch", "TextField"
    ]

    initialPage: TabbedPage{
        id: page

        title:"Demo"
        actionBar.maxActionCount: 3
        actions: [
            Action {
                iconName: "alert/warning"
                iconSource: "qrc:/qml/Images/icons/navigation/menu.svg"
                name: "Dummy error"
                onTriggered: demo.showError("Something went wrong", "Do you want to retry?", "Close", true)
            },

            Action {
                iconName: "image/color_lens"
                name: "Colors"
                iconSource: "qrc:/qml/Images/icons/navigation/menu.svg"
                onTriggered: colorPicker.show()
            },

            Action {
                iconName: "action/settings"
                name: "Settings"
                iconSource: "qrc:/qml/Images/icons/navigation/menu.svg"
                hoverAnimation: true
            },

            Action {
                iconName: "alert/warning"
                iconSource: "qrc:/qml/Images/icons/navigation/menu.svg"
                name: "THIS SHOULD BE HIDDEN!"
                visible: false
            },

            Action {
                iconName: "action/language"
                iconSource: "qrc:/qml/Images/icons/navigation/menu.svg"
                name: "Language"
                enabled: false
            },

            Action {
                iconName: "action/account_circle"
                iconSource: "qrc:/qml/Images/icons/navigation/menu.svg"
                name: "Accounts"
            }
        ]

    }


}
