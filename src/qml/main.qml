import QtQuick 2.4
import QtQuick.Controls 1.2
import "./CloudUI/components"
import "./CloudUI/window"
import "./CloudUI/core"
import "./CloudUI/popups"
import "./CloudUI/controls"

Page {
    id: page
    title: "Page with right sidebar"

    actions: [
        Action {
            iconName: "action/search"
            text: "Search"
        }
    ]

    Button {
        anchors.centerIn: parent
        text: "Sub page"
        onClicked: pageStack.push(Qt.resolvedUrl("SubPage.qml"))
    }

    rightSidebar: PageSidebar {
        title: "Sidebar"

        width: dp(320)

        actions: [
            Action {
                iconName: "action/delete"
                text: "Delete"
            }
        ]
    }
}
