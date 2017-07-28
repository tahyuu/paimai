# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'G:\WorkSpace\paimai\GUI\main_ui_wdiget.ui'
#
# Created: Wed May 24 12:23:34 2017
#      by: PyQt4 UI code generator 4.11.3
#
# WARNING! All changes made in this file will be lost!

from PyQt4 import QtCore, QtGui

try:
    _fromUtf8 = QtCore.QString.fromUtf8
except AttributeError:d
    def _fromUtf8(s):
        return s

try:
    _encoding = QtGui.QApplication.UnicodeUTF8
    def _translate(context, text, disambig):
        return QtGui.QApplication.translate(context, text, disambig, _encoding)
except AttributeError:
    def _translate(context, text, disambig):
        return QtGui.QApplication.translate(context, text, disambig)

class Ui_Form(object):
    def setupUi(self, Form):
        Form.setObjectName(_fromUtf8("Form"))
        Form.resize(241, 491)
        self.textBrowser = QtGui.QTextBrowser(Form)
        self.textBrowser.setGeometry(QtCore.QRect(10, 110, 221, 91))
        self.textBrowser.setObjectName(_fromUtf8("textBrowser"))
        self.label_2 = QtGui.QLabel(Form)
        self.label_2.setGeometry(QtCore.QRect(10, 30, 71, 16))
        self.label_2.setObjectName(_fromUtf8("label_2"))
        self.tabWidget = QtGui.QTabWidget(Form)
        self.tabWidget.setGeometry(QtCore.QRect(10, 230, 221, 251))
        self.tabWidget.setObjectName(_fromUtf8("tabWidget"))
        self.tab = QtGui.QWidget()
        self.tab.setObjectName(_fromUtf8("tab"))
        self.pushButton_4 = QtGui.QPushButton(self.tab)
        self.pushButton_4.setGeometry(QtCore.QRect(50, 10, 101, 23))
        self.pushButton_4.setObjectName(_fromUtf8("pushButton_4"))
        self.tabWidget.addTab(self.tab, _fromUtf8(""))
        self.tab2 = QtGui.QWidget()
        self.tab2.setObjectName(_fromUtf8("tab2"))
        self.tableWidget = QtGui.QTableWidget(self.tab2)
        self.tableWidget.setGeometry(QtCore.QRect(0, 40, 211, 171))
        self.tableWidget.setObjectName(_fromUtf8("tableWidget"))
        self.tableWidget.setColumnCount(2)
        self.tableWidget.setRowCount(4)
        item = QtGui.QTableWidgetItem()
        font = QtGui.QFont()
        font.setKerning(False)
        item.setFont(font)
        self.tableWidget.setVerticalHeaderItem(0, item)
        item = QtGui.QTableWidgetItem()
        self.tableWidget.setVerticalHeaderItem(1, item)
        item = QtGui.QTableWidgetItem()
        self.tableWidget.setVerticalHeaderItem(2, item)
        item = QtGui.QTableWidgetItem()
        self.tableWidget.setVerticalHeaderItem(3, item)
        item = QtGui.QTableWidgetItem()
        self.tableWidget.setHorizontalHeaderItem(0, item)
        item = QtGui.QTableWidgetItem()
        self.tableWidget.setHorizontalHeaderItem(1, item)
        item = QtGui.QTableWidgetItem()
        self.tableWidget.setItem(0, 0, item)
        item = QtGui.QTableWidgetItem()
        self.tableWidget.setItem(0, 1, item)
        item = QtGui.QTableWidgetItem()
        self.tableWidget.setItem(1, 0, item)
        item = QtGui.QTableWidgetItem()
        self.tableWidget.setItem(1, 1, item)
        item = QtGui.QTableWidgetItem()
        self.tableWidget.setItem(2, 0, item)
        item = QtGui.QTableWidgetItem()
        self.tableWidget.setItem(2, 1, item)
        item = QtGui.QTableWidgetItem()
        self.tableWidget.setItem(3, 0, item)
        item = QtGui.QTableWidgetItem()
        self.tableWidget.setItem(3, 1, item)
        self.tableWidget.horizontalHeader().setDefaultSectionSize(80)
        self.tableWidget.horizontalHeader().setMinimumSectionSize(80)
        self.pushButton = QtGui.QPushButton(self.tab2)
        self.pushButton.setGeometry(QtCore.QRect(50, 10, 101, 23))
        self.pushButton.setObjectName(_fromUtf8("pushButton"))
        self.tabWidget.addTab(self.tab2, _fromUtf8(""))
        self.tab3 = QtGui.QWidget()
        self.tab3.setObjectName(_fromUtf8("tab3"))
        self.pushButton_2 = QtGui.QPushButton(self.tab3)
        self.pushButton_2.setGeometry(QtCore.QRect(60, 10, 101, 23))
        self.pushButton_2.setObjectName(_fromUtf8("pushButton_2"))
        self.tabWidget.addTab(self.tab3, _fromUtf8(""))
        self.tab1 = QtGui.QWidget()
        self.tab1.setObjectName(_fromUtf8("tab1"))
        self.pushButton_3 = QtGui.QPushButton(self.tab1)
        self.pushButton_3.setGeometry(QtCore.QRect(60, 10, 101, 23))
        self.pushButton_3.setObjectName(_fromUtf8("pushButton_3"))
        self.tabWidget.addTab(self.tab1, _fromUtf8(""))
        self.label = QtGui.QLabel(Form)
        self.label.setGeometry(QtCore.QRect(10, 90, 71, 16))
        self.label.setObjectName(_fromUtf8("label"))
        self.label_3 = QtGui.QLabel(Form)
        self.label_3.setGeometry(QtCore.QRect(10, 210, 71, 16))
        self.label_3.setObjectName(_fromUtf8("label_3"))
        self.label_4 = QtGui.QLabel(Form)
        self.label_4.setGeometry(QtCore.QRect(20, 50, 201, 21))
        self.label_4.setStyleSheet(_fromUtf8("color:rgb(255, 0, 0);\n"
"font: 12pt \"Arial\";"))
        self.label_4.setObjectName(_fromUtf8("label_4"))

        self.retranslateUi(Form)
        self.tabWidget.setCurrentIndex(0)
        QtCore.QMetaObject.connectSlotsByName(Form)

    def retranslateUi(self, Form):
        Form.setWindowTitle(_translate("Form", "Form", None))
        self.textBrowser.setHtml(_translate("Form", "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n"
"<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\n"
"p, li { white-space: pre-wrap; }\n"
"</style></head><body style=\" font-family:\'SimSun\'; font-size:9pt; font-weight:400; font-style:normal;\">\n"
"<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" color:#ff0000;\">您好：欢迎使用</span></p></body></html>", None))
        self.label_2.setText(_translate("Form", "【当前时间】", None))
        self.pushButton_4.setText(_translate("Form", "坐标自动对齐", None))
        self.tabWidget.setTabText(self.tabWidget.indexOf(self.tab), _translate("Form", "时间", None))
        item = self.tableWidget.verticalHeaderItem(0)
        item.setText(_translate("Form", "时间", None))
        item = self.tableWidget.verticalHeaderItem(1)
        item.setText(_translate("Form", "价格", None))
        item = self.tableWidget.verticalHeaderItem(2)
        item.setText(_translate("Form", "出价", None))
        item = self.tableWidget.verticalHeaderItem(3)
        item.setText(_translate("Form", "验证码", None))
        item = self.tableWidget.horizontalHeaderItem(0)
        item.setText(_translate("Form", "图片", None))
        item = self.tableWidget.horizontalHeaderItem(1)
        item.setText(_translate("Form", "值", None))
        __sortingEnabled = self.tableWidget.isSortingEnabled()
        self.tableWidget.setSortingEnabled(False)
        item = self.tableWidget.item(0, 0)
        item.setText(_translate("Form", "11:23:22", None))
        item = self.tableWidget.item(0, 1)
        item.setText(_translate("Form", "11:23:22", None))
        item = self.tableWidget.item(1, 0)
        item.setText(_translate("Form", "89600", None))
        item = self.tableWidget.item(1, 1)
        item.setText(_translate("Form", "89700", None))
        item = self.tableWidget.item(2, 0)
        item.setText(_translate("Form", "89700", None))
        item = self.tableWidget.item(2, 1)
        item.setText(_translate("Form", "89500", None))
        item = self.tableWidget.item(3, 0)
        item.setText(_translate("Form", "1234", None))
        item = self.tableWidget.item(3, 1)
        item.setText(_translate("Form", "1234", None))
        self.tableWidget.setSortingEnabled(__sortingEnabled)
        self.pushButton.setText(_translate("Form", "坐标自动对齐", None))
        self.tabWidget.setTabText(self.tabWidget.indexOf(self.tab2), _translate("Form", "坐标", None))
        self.pushButton_2.setText(_translate("Form", "拍前测试", None))
        self.tabWidget.setTabText(self.tabWidget.indexOf(self.tab3), _translate("Form", "测试", None))
        self.pushButton_3.setText(_translate("Form", "正式开始", None))
        self.tabWidget.setTabText(self.tabWidget.indexOf(self.tab1), _translate("Form", "开始", None))
        self.label.setText(_translate("Form", "【引导信息】", None))
        self.label_3.setText(_translate("Form", "【执行动作】", None))
        self.label_4.setText(_translate("Form", "2017年05月24日 11:13:00", None))


if __name__ == "__main__":
    import sys
    app = QtGui.QApplication(sys.argv)
    Form = QtGui.QWidget()
    ui = Ui_Form()
    ui.setupUi(Form)
    Form.show()
    sys.exit(app.exec_())

