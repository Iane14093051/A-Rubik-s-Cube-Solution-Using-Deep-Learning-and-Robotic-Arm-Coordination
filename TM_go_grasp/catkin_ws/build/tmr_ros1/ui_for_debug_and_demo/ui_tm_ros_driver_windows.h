/********************************************************************************
** Form generated from reading UI file 'tm_ros_driver_windows.ui'
**
** Created by: Qt User Interface Compiler version 5.12.8
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_TM_ROS_DRIVER_WINDOWS_H
#define UI_TM_ROS_DRIVER_WINDOWS_H

#include <QtCore/QLocale>
#include <QtCore/QVariant>
#include <QtWidgets/QApplication>
#include <QtWidgets/QDialog>
#include <QtWidgets/QGridLayout>
#include <QtWidgets/QGroupBox>
#include <QtWidgets/QLabel>
#include <QtWidgets/QListView>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QTabWidget>
#include <QtWidgets/QTextBrowser>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_MainWindow
{
public:
    QWidget *widget_Black;
    QWidget *widget_Robot_Response;
    QTabWidget *log_tabWidget;
    QWidget *Console_output_tab;
    QGridLayout *gridLayout_2;
    QTextBrowser *commandout;
    QWidget *Robot_Response_tab;
    QGridLayout *gridLayout_3;
    QPushButton *clear_response_button;
    QListView *robot_response_listView;
    QWidget *widget_Connection_Status;
    QGroupBox *Connection_Status_groupBox;
    QWidget *widget_ROSClient;
    QLabel *SvrClient_label;
    QPushButton *set_svr_re_connect_button;
    QLabel *svrclient_status_label;
    QLabel *ReConnect_label;
    QLabel *SctClient_label;
    QLabel *sctclient_status_label;
    QPushButton *set_sct_re_connect_button;
    QLabel *Connect_to_TM_Server_label;
    QTabWidget *configure_tabWidget;
    QWidget *Robot_Status_tab;
    QGroupBox *Robot_Status_groupBox;
    QWidget *widget_Robot_Status_black;
    QWidget *widget_Project_Run;
    QLabel *Project_Run_label;
    QLabel *project_run_status_label;
    QWidget *widget_Project_Pause;
    QLabel *Project_Pause_label;
    QLabel *project_pause_status_label;
    QWidget *widget_Robot_Link;
    QLabel *Robot_Link_label;
    QLabel *robot_link_status_label;
    QWidget *widget_ESTOP;
    QLabel *ESTOP_label;
    QLabel *estop_status_label;
    QWidget *widget_Data_Table_Correct;
    QLabel *Data_Table_Correct_label;
    QLabel *data_table_correct_status_label;
    QWidget *widget_Safeguard_A;
    QLabel *Safeguard_A_label;
    QLabel *safeguard_a_status_label;
    QWidget *widget_Robot_Error;
    QLabel *Robot_Error_label;
    QLabel *robot_error_status_label;
    QWidget *widget_Error_Code;
    QLabel *Error_Code_label;
    QLabel *error_code_status_label;
    QWidget *widget_Error_Content;
    QLabel *MA_Mode_label;
    QLabel *ma_mode_label;
    QWidget *ControlBox_tab;
    QGroupBox *ControlBox_groupBox;
    QWidget *widget_ControlBox_black;
    QPushButton *change_control_box_io_button;
    QLabel *DO0_Ctrl_label;
    QLabel *ctrl_do0_status_label;
    QWidget *CQ_Monitor_tab;
    QGroupBox *CQ_Monitor_groupBox;
    QWidget *widget_CQ_Monitor_black;
    QLabel *LinkLost_label;
    QLabel *linklost_status_label;
    QLabel *MaxLostTime_label;
    QLabel *maxlosttime_status_label;
    QPushButton *Close;
    QGroupBox *Response_ROS_Node_groupBox;
    QWidget *widget_Response_ROS_Node;
    QLabel *TMSVR_label;
    QLabel *tmsrv_cperr_status_label;
    QLabel *DataErr_label;
    QLabel *TMScript_label;
    QLabel *tmscript_cperr_status_label;
    QLabel *CPERR_label;
    QLabel *tmsrv_dataerr_status_label;
    QLabel *tmscript_dataerr_status_label;

    void setupUi(QDialog *MainWindow)
    {
        if (MainWindow->objectName().isEmpty())
            MainWindow->setObjectName(QString::fromUtf8("MainWindow"));
        MainWindow->resize(1042, 702);
        MainWindow->setStyleSheet(QString::fromUtf8("background-color: rgb(141, 192, 53);"));
        widget_Black = new QWidget(MainWindow);
        widget_Black->setObjectName(QString::fromUtf8("widget_Black"));
        widget_Black->setGeometry(QRect(-10, 10, 1291, 681));
        widget_Black->setContextMenuPolicy(Qt::ActionsContextMenu);
        widget_Black->setLayoutDirection(Qt::LeftToRight);
        widget_Black->setStyleSheet(QString::fromUtf8("background-color: rgb(30, 30, 30);"));
        widget_Robot_Response = new QWidget(widget_Black);
        widget_Robot_Response->setObjectName(QString::fromUtf8("widget_Robot_Response"));
        widget_Robot_Response->setGeometry(QRect(590, 10, 451, 661));
        widget_Robot_Response->setStyleSheet(QString::fromUtf8("background-color: rgb(85, 87, 83);"));
        log_tabWidget = new QTabWidget(widget_Robot_Response);
        log_tabWidget->setObjectName(QString::fromUtf8("log_tabWidget"));
        log_tabWidget->setGeometry(QRect(18, 10, 416, 632));
        QFont font;
        font.setFamily(QString::fromUtf8("Ubuntu Condensed"));
        font.setPointSize(14);
        font.setItalic(true);
        log_tabWidget->setFont(font);
        log_tabWidget->setLocale(QLocale(QLocale::English, QLocale::UnitedStates));
        Console_output_tab = new QWidget();
        Console_output_tab->setObjectName(QString::fromUtf8("Console_output_tab"));
        gridLayout_2 = new QGridLayout(Console_output_tab);
        gridLayout_2->setObjectName(QString::fromUtf8("gridLayout_2"));
        commandout = new QTextBrowser(Console_output_tab);
        commandout->setObjectName(QString::fromUtf8("commandout"));
        QSizePolicy sizePolicy(QSizePolicy::Expanding, QSizePolicy::Expanding);
        sizePolicy.setHorizontalStretch(0);
        sizePolicy.setVerticalStretch(0);
        sizePolicy.setHeightForWidth(commandout->sizePolicy().hasHeightForWidth());
        commandout->setSizePolicy(sizePolicy);
        commandout->setMinimumSize(QSize(0, 0));
#ifndef QT_NO_TOOLTIP
        commandout->setToolTip(QString::fromUtf8(""));
#endif // QT_NO_TOOLTIP
#ifndef QT_NO_STATUSTIP
        commandout->setStatusTip(QString::fromUtf8(""));
#endif // QT_NO_STATUSTIP
#ifndef QT_NO_WHATSTHIS
        commandout->setWhatsThis(QString::fromUtf8(""));
#endif // QT_NO_WHATSTHIS
#ifndef QT_NO_ACCESSIBILITY
        commandout->setAccessibleName(QString::fromUtf8(""));
#endif // QT_NO_ACCESSIBILITY
#ifndef QT_NO_ACCESSIBILITY
        commandout->setAccessibleDescription(QString::fromUtf8(""));
#endif // QT_NO_ACCESSIBILITY
        commandout->setLineWrapMode(QTextEdit::NoWrap);
        commandout->setSearchPaths(QStringList());

        gridLayout_2->addWidget(commandout, 0, 0, 1, 1);

        log_tabWidget->addTab(Console_output_tab, QString());
        Robot_Response_tab = new QWidget();
        Robot_Response_tab->setObjectName(QString::fromUtf8("Robot_Response_tab"));
        gridLayout_3 = new QGridLayout(Robot_Response_tab);
        gridLayout_3->setObjectName(QString::fromUtf8("gridLayout_3"));
        clear_response_button = new QPushButton(Robot_Response_tab);
        clear_response_button->setObjectName(QString::fromUtf8("clear_response_button"));
        QSizePolicy sizePolicy1(QSizePolicy::Fixed, QSizePolicy::Fixed);
        sizePolicy1.setHorizontalStretch(0);
        sizePolicy1.setVerticalStretch(0);
        sizePolicy1.setHeightForWidth(clear_response_button->sizePolicy().hasHeightForWidth());
        clear_response_button->setSizePolicy(sizePolicy1);
        clear_response_button->setMinimumSize(QSize(120, 34));
        clear_response_button->setMaximumSize(QSize(120, 34));
        clear_response_button->setFocusPolicy(Qt::NoFocus);
        clear_response_button->setStyleSheet(QString::fromUtf8("background-color: rgb(130, 135, 139); color: white;"));
        clear_response_button->setLocale(QLocale(QLocale::English, QLocale::UnitedStates));

        gridLayout_3->addWidget(clear_response_button, 2, 1, 1, 1);

        robot_response_listView = new QListView(Robot_Response_tab);
        robot_response_listView->setObjectName(QString::fromUtf8("robot_response_listView"));
        robot_response_listView->setStyleSheet(QString::fromUtf8("background-color: rgb(180, 180, 180);"));

        gridLayout_3->addWidget(robot_response_listView, 0, 0, 1, 2);

        log_tabWidget->addTab(Robot_Response_tab, QString());
        widget_Connection_Status = new QWidget(widget_Black);
        widget_Connection_Status->setObjectName(QString::fromUtf8("widget_Connection_Status"));
        widget_Connection_Status->setGeometry(QRect(20, 10, 561, 661));
        widget_Connection_Status->setStyleSheet(QString::fromUtf8("background-color: rgb(85, 87, 83);"));
        Connection_Status_groupBox = new QGroupBox(widget_Connection_Status);
        Connection_Status_groupBox->setObjectName(QString::fromUtf8("Connection_Status_groupBox"));
        Connection_Status_groupBox->setGeometry(QRect(20, 10, 521, 131));
        QFont font1;
        font1.setFamily(QString::fromUtf8("Ubuntu Condensed"));
        font1.setPointSize(18);
        font1.setBold(false);
        font1.setItalic(true);
        font1.setUnderline(false);
        font1.setWeight(50);
        font1.setStrikeOut(false);
        font1.setKerning(true);
        Connection_Status_groupBox->setFont(font1);
        Connection_Status_groupBox->setStyleSheet(QString::fromUtf8("        QGroupBox {\n"
"            border-color: rgb(50, 50, 50);\n"
"            border: 2px solid lightgray; \n"
"            border-width: 0.5px;\n"
"            border-style: solid;\n"
"            margin-top: 1ex; /* leave space at the top for the title */ \n"
"        }\n"
"        QGroupBox::title {\n"
"            subcontrol-origin: margin;\n"
"            subcontrol-position: top left;\n"
"            left: 10px;\n"
"            margin-left: 0px;\n"
"            padding: 0  3px;\n"
"        }"));
        Connection_Status_groupBox->setFlat(false);
        widget_ROSClient = new QWidget(Connection_Status_groupBox);
        widget_ROSClient->setObjectName(QString::fromUtf8("widget_ROSClient"));
        widget_ROSClient->setGeometry(QRect(10, 26, 501, 93));
        widget_ROSClient->setStyleSheet(QString::fromUtf8("background-color: rgb(81, 86, 90);"));
        SvrClient_label = new QLabel(widget_ROSClient);
        SvrClient_label->setObjectName(QString::fromUtf8("SvrClient_label"));
        SvrClient_label->setGeometry(QRect(50, 30, 121, 31));
        QFont font2;
        font2.setPointSize(8);
        SvrClient_label->setFont(font2);
        SvrClient_label->setStyleSheet(QString::fromUtf8("co"));
        set_svr_re_connect_button = new QPushButton(widget_ROSClient);
        set_svr_re_connect_button->setObjectName(QString::fromUtf8("set_svr_re_connect_button"));
        set_svr_re_connect_button->setGeometry(QRect(340, 32, 121, 21));
        set_svr_re_connect_button->setStyleSheet(QString::fromUtf8("background-color: rgb(130, 135, 139); color: white;"));
        svrclient_status_label = new QLabel(widget_ROSClient);
        svrclient_status_label->setObjectName(QString::fromUtf8("svrclient_status_label"));
        svrclient_status_label->setGeometry(QRect(210, 30, 61, 31));
        svrclient_status_label->setFont(font2);
        svrclient_status_label->setStyleSheet(QString::fromUtf8("co"));
        ReConnect_label = new QLabel(widget_ROSClient);
        ReConnect_label->setObjectName(QString::fromUtf8("ReConnect_label"));
        ReConnect_label->setGeometry(QRect(360, 0, 131, 31));
        ReConnect_label->setFont(font2);
        ReConnect_label->setStyleSheet(QString::fromUtf8("co"));
        SctClient_label = new QLabel(widget_ROSClient);
        SctClient_label->setObjectName(QString::fromUtf8("SctClient_label"));
        SctClient_label->setGeometry(QRect(40, 60, 121, 31));
        SctClient_label->setFont(font2);
        SctClient_label->setStyleSheet(QString::fromUtf8("co"));
        sctclient_status_label = new QLabel(widget_ROSClient);
        sctclient_status_label->setObjectName(QString::fromUtf8("sctclient_status_label"));
        sctclient_status_label->setGeometry(QRect(210, 60, 61, 31));
        sctclient_status_label->setFont(font2);
        sctclient_status_label->setStyleSheet(QString::fromUtf8("co"));
        set_sct_re_connect_button = new QPushButton(widget_ROSClient);
        set_sct_re_connect_button->setObjectName(QString::fromUtf8("set_sct_re_connect_button"));
        set_sct_re_connect_button->setGeometry(QRect(340, 63, 121, 21));
        set_sct_re_connect_button->setStyleSheet(QString::fromUtf8("background-color: rgb(130, 135, 139); color: white;"));
        Connect_to_TM_Server_label = new QLabel(widget_ROSClient);
        Connect_to_TM_Server_label->setObjectName(QString::fromUtf8("Connect_to_TM_Server_label"));
        Connect_to_TM_Server_label->setGeometry(QRect(190, 0, 131, 31));
        Connect_to_TM_Server_label->setFont(font2);
        Connect_to_TM_Server_label->setStyleSheet(QString::fromUtf8("co"));
        configure_tabWidget = new QTabWidget(widget_Connection_Status);
        configure_tabWidget->setObjectName(QString::fromUtf8("configure_tabWidget"));
        configure_tabWidget->setEnabled(true);
        configure_tabWidget->setGeometry(QRect(20, 300, 521, 336));
        QFont font3;
        font3.setPointSize(12);
        font3.setBold(true);
        font3.setItalic(true);
        font3.setWeight(75);
        configure_tabWidget->setFont(font3);
        configure_tabWidget->setFocusPolicy(Qt::NoFocus);
        configure_tabWidget->setAutoFillBackground(false);
        configure_tabWidget->setTabPosition(QTabWidget::North);
        configure_tabWidget->setTabShape(QTabWidget::Rounded);
        Robot_Status_tab = new QWidget();
        Robot_Status_tab->setObjectName(QString::fromUtf8("Robot_Status_tab"));
        Robot_Status_groupBox = new QGroupBox(Robot_Status_tab);
        Robot_Status_groupBox->setObjectName(QString::fromUtf8("Robot_Status_groupBox"));
        Robot_Status_groupBox->setGeometry(QRect(3, -2, 509, 301));
        Robot_Status_groupBox->setFont(font1);
        Robot_Status_groupBox->setStyleSheet(QString::fromUtf8("        QGroupBox {\n"
"            border-color: rgb(50, 50, 50);\n"
"            border: 2px solid lightgray; \n"
"            border-width: 0.5px;\n"
"            border-style: solid;\n"
"            margin-top: 1ex; /* leave space at the top for the title */ \n"
"        }\n"
"        QGroupBox::title {\n"
"            subcontrol-origin: margin;\n"
"            subcontrol-position: top left;\n"
"            left: 10px;\n"
"            margin-left: 0px;\n"
"            padding: 0  3px;\n"
"        }"));
        Robot_Status_groupBox->setFlat(false);
        widget_Robot_Status_black = new QWidget(Robot_Status_groupBox);
        widget_Robot_Status_black->setObjectName(QString::fromUtf8("widget_Robot_Status_black"));
        widget_Robot_Status_black->setGeometry(QRect(10, 20, 491, 273));
        widget_Robot_Status_black->setStyleSheet(QString::fromUtf8("background-color: rgb(81, 86, 90);"));
        widget_Project_Run = new QWidget(widget_Robot_Status_black);
        widget_Project_Run->setObjectName(QString::fromUtf8("widget_Project_Run"));
        widget_Project_Run->setGeometry(QRect(160, 0, 161, 81));
        widget_Project_Run->setStyleSheet(QString::fromUtf8("background-color: rgb(81, 86, 90);"));
        Project_Run_label = new QLabel(widget_Project_Run);
        Project_Run_label->setObjectName(QString::fromUtf8("Project_Run_label"));
        Project_Run_label->setGeometry(QRect(30, 0, 161, 31));
        Project_Run_label->setFont(font2);
        Project_Run_label->setStyleSheet(QString::fromUtf8("co"));
        project_run_status_label = new QLabel(widget_Project_Run);
        project_run_status_label->setObjectName(QString::fromUtf8("project_run_status_label"));
        project_run_status_label->setGeometry(QRect(50, 40, 61, 31));
        project_run_status_label->setFont(font2);
        project_run_status_label->setStyleSheet(QString::fromUtf8("co"));
        widget_Project_Pause = new QWidget(widget_Robot_Status_black);
        widget_Project_Pause->setObjectName(QString::fromUtf8("widget_Project_Pause"));
        widget_Project_Pause->setGeometry(QRect(330, 0, 161, 81));
        widget_Project_Pause->setStyleSheet(QString::fromUtf8("background-color: rgb(81, 86, 90);"));
        Project_Pause_label = new QLabel(widget_Project_Pause);
        Project_Pause_label->setObjectName(QString::fromUtf8("Project_Pause_label"));
        Project_Pause_label->setGeometry(QRect(20, 0, 161, 31));
        Project_Pause_label->setFont(font2);
        Project_Pause_label->setStyleSheet(QString::fromUtf8("co"));
        project_pause_status_label = new QLabel(widget_Project_Pause);
        project_pause_status_label->setObjectName(QString::fromUtf8("project_pause_status_label"));
        project_pause_status_label->setGeometry(QRect(50, 40, 61, 31));
        project_pause_status_label->setFont(font2);
        project_pause_status_label->setStyleSheet(QString::fromUtf8("co"));
        widget_Robot_Link = new QWidget(widget_Robot_Status_black);
        widget_Robot_Link->setObjectName(QString::fromUtf8("widget_Robot_Link"));
        widget_Robot_Link->setGeometry(QRect(0, 90, 161, 81));
        widget_Robot_Link->setStyleSheet(QString::fromUtf8("background-color: rgb(81, 86, 90);"));
        Robot_Link_label = new QLabel(widget_Robot_Link);
        Robot_Link_label->setObjectName(QString::fromUtf8("Robot_Link_label"));
        Robot_Link_label->setGeometry(QRect(30, 0, 161, 31));
        Robot_Link_label->setFont(font2);
        Robot_Link_label->setStyleSheet(QString::fromUtf8("co"));
        robot_link_status_label = new QLabel(widget_Robot_Link);
        robot_link_status_label->setObjectName(QString::fromUtf8("robot_link_status_label"));
        robot_link_status_label->setGeometry(QRect(50, 40, 61, 31));
        robot_link_status_label->setFont(font2);
        robot_link_status_label->setStyleSheet(QString::fromUtf8("co"));
        widget_ESTOP = new QWidget(widget_Robot_Status_black);
        widget_ESTOP->setObjectName(QString::fromUtf8("widget_ESTOP"));
        widget_ESTOP->setGeometry(QRect(330, 90, 161, 81));
        widget_ESTOP->setStyleSheet(QString::fromUtf8("background-color: rgb(81, 86, 90);"));
        ESTOP_label = new QLabel(widget_ESTOP);
        ESTOP_label->setObjectName(QString::fromUtf8("ESTOP_label"));
        ESTOP_label->setGeometry(QRect(40, 0, 161, 31));
        ESTOP_label->setFont(font2);
        ESTOP_label->setStyleSheet(QString::fromUtf8("co"));
        estop_status_label = new QLabel(widget_ESTOP);
        estop_status_label->setObjectName(QString::fromUtf8("estop_status_label"));
        estop_status_label->setGeometry(QRect(50, 40, 61, 31));
        estop_status_label->setFont(font2);
        estop_status_label->setStyleSheet(QString::fromUtf8("co"));
        widget_Data_Table_Correct = new QWidget(widget_Robot_Status_black);
        widget_Data_Table_Correct->setObjectName(QString::fromUtf8("widget_Data_Table_Correct"));
        widget_Data_Table_Correct->setGeometry(QRect(160, 90, 161, 81));
        widget_Data_Table_Correct->setStyleSheet(QString::fromUtf8("background-color: rgb(81, 86, 90);"));
        Data_Table_Correct_label = new QLabel(widget_Data_Table_Correct);
        Data_Table_Correct_label->setObjectName(QString::fromUtf8("Data_Table_Correct_label"));
        Data_Table_Correct_label->setGeometry(QRect(10, 0, 161, 31));
        Data_Table_Correct_label->setFont(font2);
        Data_Table_Correct_label->setStyleSheet(QString::fromUtf8("co"));
        data_table_correct_status_label = new QLabel(widget_Data_Table_Correct);
        data_table_correct_status_label->setObjectName(QString::fromUtf8("data_table_correct_status_label"));
        data_table_correct_status_label->setGeometry(QRect(50, 40, 61, 31));
        data_table_correct_status_label->setFont(font2);
        data_table_correct_status_label->setStyleSheet(QString::fromUtf8("co"));
        widget_Safeguard_A = new QWidget(widget_Robot_Status_black);
        widget_Safeguard_A->setObjectName(QString::fromUtf8("widget_Safeguard_A"));
        widget_Safeguard_A->setGeometry(QRect(330, 180, 161, 81));
        widget_Safeguard_A->setStyleSheet(QString::fromUtf8("background-color: rgb(81, 86, 90);"));
        Safeguard_A_label = new QLabel(widget_Safeguard_A);
        Safeguard_A_label->setObjectName(QString::fromUtf8("Safeguard_A_label"));
        Safeguard_A_label->setGeometry(QRect(30, 0, 161, 31));
        Safeguard_A_label->setFont(font2);
        Safeguard_A_label->setStyleSheet(QString::fromUtf8("co"));
        safeguard_a_status_label = new QLabel(widget_Safeguard_A);
        safeguard_a_status_label->setObjectName(QString::fromUtf8("safeguard_a_status_label"));
        safeguard_a_status_label->setGeometry(QRect(50, 40, 61, 31));
        safeguard_a_status_label->setFont(font2);
        safeguard_a_status_label->setStyleSheet(QString::fromUtf8("co"));
        widget_Robot_Error = new QWidget(widget_Robot_Status_black);
        widget_Robot_Error->setObjectName(QString::fromUtf8("widget_Robot_Error"));
        widget_Robot_Error->setGeometry(QRect(0, 180, 161, 81));
        widget_Robot_Error->setStyleSheet(QString::fromUtf8("background-color: rgb(81, 86, 90);"));
        Robot_Error_label = new QLabel(widget_Robot_Error);
        Robot_Error_label->setObjectName(QString::fromUtf8("Robot_Error_label"));
        Robot_Error_label->setGeometry(QRect(30, 0, 161, 31));
        Robot_Error_label->setFont(font2);
        Robot_Error_label->setStyleSheet(QString::fromUtf8("co"));
        robot_error_status_label = new QLabel(widget_Robot_Error);
        robot_error_status_label->setObjectName(QString::fromUtf8("robot_error_status_label"));
        robot_error_status_label->setGeometry(QRect(50, 40, 61, 31));
        robot_error_status_label->setFont(font2);
        robot_error_status_label->setStyleSheet(QString::fromUtf8("co"));
        widget_Error_Code = new QWidget(widget_Robot_Status_black);
        widget_Error_Code->setObjectName(QString::fromUtf8("widget_Error_Code"));
        widget_Error_Code->setGeometry(QRect(160, 180, 161, 81));
        widget_Error_Code->setStyleSheet(QString::fromUtf8("background-color: rgb(81, 86, 90);"));
        Error_Code_label = new QLabel(widget_Error_Code);
        Error_Code_label->setObjectName(QString::fromUtf8("Error_Code_label"));
        Error_Code_label->setGeometry(QRect(30, 0, 161, 31));
        Error_Code_label->setFont(font2);
        Error_Code_label->setStyleSheet(QString::fromUtf8("co"));
        error_code_status_label = new QLabel(widget_Error_Code);
        error_code_status_label->setObjectName(QString::fromUtf8("error_code_status_label"));
        error_code_status_label->setGeometry(QRect(50, 40, 101, 31));
        error_code_status_label->setFont(font2);
        error_code_status_label->setStyleSheet(QString::fromUtf8("co"));
        widget_Error_Content = new QWidget(widget_Robot_Status_black);
        widget_Error_Content->setObjectName(QString::fromUtf8("widget_Error_Content"));
        widget_Error_Content->setGeometry(QRect(0, 0, 161, 81));
        widget_Error_Content->setStyleSheet(QString::fromUtf8("background-color: rgb(81, 86, 90);"));
        MA_Mode_label = new QLabel(widget_Error_Content);
        MA_Mode_label->setObjectName(QString::fromUtf8("MA_Mode_label"));
        MA_Mode_label->setGeometry(QRect(30, 0, 111, 31));
        MA_Mode_label->setFont(font2);
        MA_Mode_label->setStyleSheet(QString::fromUtf8("co"));
        ma_mode_label = new QLabel(widget_Error_Content);
        ma_mode_label->setObjectName(QString::fromUtf8("ma_mode_label"));
        ma_mode_label->setGeometry(QRect(50, 40, 91, 31));
        ma_mode_label->setFont(font2);
        ma_mode_label->setStyleSheet(QString::fromUtf8("co"));
        configure_tabWidget->addTab(Robot_Status_tab, QString());
        ControlBox_tab = new QWidget();
        ControlBox_tab->setObjectName(QString::fromUtf8("ControlBox_tab"));
        ControlBox_groupBox = new QGroupBox(ControlBox_tab);
        ControlBox_groupBox->setObjectName(QString::fromUtf8("ControlBox_groupBox"));
        ControlBox_groupBox->setGeometry(QRect(4, 0, 517, 373));
        ControlBox_groupBox->setFont(font1);
        ControlBox_groupBox->setStyleSheet(QString::fromUtf8("        QGroupBox {\n"
"            border-color: rgb(50, 50, 50);\n"
"            border: 2px solid lightgray; \n"
"            border-width: 0.5px;\n"
"            border-style: solid;\n"
"            margin-top: 1ex; /* leave space at the top for the title */ \n"
"        }\n"
"        QGroupBox::title {\n"
"            subcontrol-origin: margin;\n"
"            subcontrol-position: top left;\n"
"            left: 10px;\n"
"            margin-left: 0px;\n"
"            padding: 0  3px;\n"
"        }"));
        ControlBox_groupBox->setFlat(false);
        widget_ControlBox_black = new QWidget(ControlBox_groupBox);
        widget_ControlBox_black->setObjectName(QString::fromUtf8("widget_ControlBox_black"));
        widget_ControlBox_black->setGeometry(QRect(8, 18, 501, 341));
        widget_ControlBox_black->setStyleSheet(QString::fromUtf8("background-color: rgb(81, 86, 90);"));
        change_control_box_io_button = new QPushButton(widget_ControlBox_black);
        change_control_box_io_button->setObjectName(QString::fromUtf8("change_control_box_io_button"));
        change_control_box_io_button->setGeometry(QRect(150, 45, 121, 21));
        change_control_box_io_button->setStyleSheet(QString::fromUtf8("background-color: rgb(130, 135, 139); color: white;"));
        DO0_Ctrl_label = new QLabel(widget_ControlBox_black);
        DO0_Ctrl_label->setObjectName(QString::fromUtf8("DO0_Ctrl_label"));
        DO0_Ctrl_label->setGeometry(QRect(40, 40, 101, 31));
        DO0_Ctrl_label->setFont(font2);
        DO0_Ctrl_label->setStyleSheet(QString::fromUtf8("co"));
        ctrl_do0_status_label = new QLabel(widget_ControlBox_black);
        ctrl_do0_status_label->setObjectName(QString::fromUtf8("ctrl_do0_status_label"));
        ctrl_do0_status_label->setGeometry(QRect(310, 40, 61, 31));
        ctrl_do0_status_label->setFont(font2);
        ctrl_do0_status_label->setStyleSheet(QString::fromUtf8("co"));
        configure_tabWidget->addTab(ControlBox_tab, QString());
        CQ_Monitor_tab = new QWidget();
        CQ_Monitor_tab->setObjectName(QString::fromUtf8("CQ_Monitor_tab"));
        CQ_Monitor_groupBox = new QGroupBox(CQ_Monitor_tab);
        CQ_Monitor_groupBox->setObjectName(QString::fromUtf8("CQ_Monitor_groupBox"));
        CQ_Monitor_groupBox->setGeometry(QRect(4, 0, 517, 373));
        CQ_Monitor_groupBox->setFont(font1);
        CQ_Monitor_groupBox->setStyleSheet(QString::fromUtf8("        QGroupBox {\n"
"            border-color: rgb(50, 50, 50);\n"
"            border: 2px solid lightgray; \n"
"            border-width: 0.5px;\n"
"            border-style: solid;\n"
"            margin-top: 1ex; /* leave space at the top for the title */ \n"
"        }\n"
"        QGroupBox::title {\n"
"            subcontrol-origin: margin;\n"
"            subcontrol-position: top left;\n"
"            left: 10px;\n"
"            margin-left: 0px;\n"
"            padding: 0  3px;\n"
"        }"));
        CQ_Monitor_groupBox->setFlat(false);
        widget_CQ_Monitor_black = new QWidget(CQ_Monitor_groupBox);
        widget_CQ_Monitor_black->setObjectName(QString::fromUtf8("widget_CQ_Monitor_black"));
        widget_CQ_Monitor_black->setGeometry(QRect(8, 18, 501, 341));
        widget_CQ_Monitor_black->setStyleSheet(QString::fromUtf8("background-color: rgb(81, 86, 90);"));
        LinkLost_label = new QLabel(widget_CQ_Monitor_black);
        LinkLost_label->setObjectName(QString::fromUtf8("LinkLost_label"));
        LinkLost_label->setGeometry(QRect(40, 40, 101, 31));
        LinkLost_label->setFont(font2);
        LinkLost_label->setStyleSheet(QString::fromUtf8("co"));
        linklost_status_label = new QLabel(widget_CQ_Monitor_black);
        linklost_status_label->setObjectName(QString::fromUtf8("linklost_status_label"));
        linklost_status_label->setGeometry(QRect(310, 40, 61, 31));
        linklost_status_label->setFont(font2);
        linklost_status_label->setStyleSheet(QString::fromUtf8("co"));
        MaxLostTime_label = new QLabel(widget_CQ_Monitor_black);
        MaxLostTime_label->setObjectName(QString::fromUtf8("MaxLostTime_label"));
        MaxLostTime_label->setGeometry(QRect(40, 70, 151, 31));
        MaxLostTime_label->setFont(font2);
        MaxLostTime_label->setStyleSheet(QString::fromUtf8("co"));
        maxlosttime_status_label = new QLabel(widget_CQ_Monitor_black);
        maxlosttime_status_label->setObjectName(QString::fromUtf8("maxlosttime_status_label"));
        maxlosttime_status_label->setGeometry(QRect(310, 70, 61, 31));
        maxlosttime_status_label->setFont(font2);
        maxlosttime_status_label->setStyleSheet(QString::fromUtf8("co"));
        configure_tabWidget->addTab(CQ_Monitor_tab, QString());
        Close = new QPushButton(widget_Connection_Status);
        Close->setObjectName(QString::fromUtf8("Close"));
        Close->setGeometry(QRect(0, 640, 89, 25));
        Close->setStyleSheet(QString::fromUtf8("background-color: rgb(141, 192, 53);"));
        Response_ROS_Node_groupBox = new QGroupBox(widget_Connection_Status);
        Response_ROS_Node_groupBox->setObjectName(QString::fromUtf8("Response_ROS_Node_groupBox"));
        Response_ROS_Node_groupBox->setGeometry(QRect(20, 150, 521, 141));
        Response_ROS_Node_groupBox->setFont(font1);
        Response_ROS_Node_groupBox->setStyleSheet(QString::fromUtf8("        QGroupBox {\n"
"            border-color: rgb(50, 50, 50);\n"
"            border: 2px solid lightgray; \n"
"            border-width: 0.5px;\n"
"            border-style: solid;\n"
"            margin-top: 1ex; /* leave space at the top for the title */ \n"
"        }\n"
"        QGroupBox::title {\n"
"            subcontrol-origin: margin;\n"
"            subcontrol-position: top left;\n"
"            left: 10px;\n"
"            margin-left: 0px;\n"
"            padding: 0  3px;\n"
"        }"));
        Response_ROS_Node_groupBox->setFlat(false);
        widget_Response_ROS_Node = new QWidget(Response_ROS_Node_groupBox);
        widget_Response_ROS_Node->setObjectName(QString::fromUtf8("widget_Response_ROS_Node"));
        widget_Response_ROS_Node->setGeometry(QRect(10, 30, 501, 101));
        widget_Response_ROS_Node->setStyleSheet(QString::fromUtf8("background-color: rgb(81, 86, 90);"));
        TMSVR_label = new QLabel(widget_Response_ROS_Node);
        TMSVR_label->setObjectName(QString::fromUtf8("TMSVR_label"));
        TMSVR_label->setGeometry(QRect(60, 30, 141, 31));
        TMSVR_label->setFont(font2);
        TMSVR_label->setStyleSheet(QString::fromUtf8("co"));
        tmsrv_cperr_status_label = new QLabel(widget_Response_ROS_Node);
        tmsrv_cperr_status_label->setObjectName(QString::fromUtf8("tmsrv_cperr_status_label"));
        tmsrv_cperr_status_label->setGeometry(QRect(210, 30, 61, 31));
        tmsrv_cperr_status_label->setFont(font2);
        tmsrv_cperr_status_label->setStyleSheet(QString::fromUtf8("co"));
        DataErr_label = new QLabel(widget_Response_ROS_Node);
        DataErr_label->setObjectName(QString::fromUtf8("DataErr_label"));
        DataErr_label->setGeometry(QRect(370, 0, 131, 31));
        DataErr_label->setFont(font2);
        DataErr_label->setStyleSheet(QString::fromUtf8("co"));
        TMScript_label = new QLabel(widget_Response_ROS_Node);
        TMScript_label->setObjectName(QString::fromUtf8("TMScript_label"));
        TMScript_label->setGeometry(QRect(30, 60, 141, 31));
        TMScript_label->setFont(font2);
        TMScript_label->setStyleSheet(QString::fromUtf8("co"));
        tmscript_cperr_status_label = new QLabel(widget_Response_ROS_Node);
        tmscript_cperr_status_label->setObjectName(QString::fromUtf8("tmscript_cperr_status_label"));
        tmscript_cperr_status_label->setGeometry(QRect(210, 60, 61, 31));
        tmscript_cperr_status_label->setFont(font2);
        tmscript_cperr_status_label->setStyleSheet(QString::fromUtf8("co"));
        CPERR_label = new QLabel(widget_Response_ROS_Node);
        CPERR_label->setObjectName(QString::fromUtf8("CPERR_label"));
        CPERR_label->setGeometry(QRect(205, 0, 131, 31));
        CPERR_label->setFont(font2);
        CPERR_label->setStyleSheet(QString::fromUtf8("co"));
        tmsrv_dataerr_status_label = new QLabel(widget_Response_ROS_Node);
        tmsrv_dataerr_status_label->setObjectName(QString::fromUtf8("tmsrv_dataerr_status_label"));
        tmsrv_dataerr_status_label->setGeometry(QRect(380, 30, 61, 31));
        tmsrv_dataerr_status_label->setFont(font2);
        tmsrv_dataerr_status_label->setStyleSheet(QString::fromUtf8("co"));
        tmscript_dataerr_status_label = new QLabel(widget_Response_ROS_Node);
        tmscript_dataerr_status_label->setObjectName(QString::fromUtf8("tmscript_dataerr_status_label"));
        tmscript_dataerr_status_label->setGeometry(QRect(380, 60, 61, 31));
        tmscript_dataerr_status_label->setFont(font2);
        tmscript_dataerr_status_label->setStyleSheet(QString::fromUtf8("co"));

        retranslateUi(MainWindow);

        log_tabWidget->setCurrentIndex(0);
        configure_tabWidget->setCurrentIndex(0);


        QMetaObject::connectSlotsByName(MainWindow);
    } // setupUi

    void retranslateUi(QDialog *MainWindow)
    {
        MainWindow->setWindowTitle(QApplication::translate("MainWindow", "QuickView_GUI", nullptr));
#ifndef QT_NO_ACCESSIBILITY
        log_tabWidget->setAccessibleName(QString());
#endif // QT_NO_ACCESSIBILITY
#ifndef QT_NO_ACCESSIBILITY
        log_tabWidget->setAccessibleDescription(QString());
#endif // QT_NO_ACCESSIBILITY
        log_tabWidget->setTabText(log_tabWidget->indexOf(Console_output_tab), QApplication::translate("MainWindow", "Console output", nullptr));
#ifndef QT_NO_ACCESSIBILITY
        clear_response_button->setAccessibleName(QString());
#endif // QT_NO_ACCESSIBILITY
#ifndef QT_NO_ACCESSIBILITY
        clear_response_button->setAccessibleDescription(QString());
#endif // QT_NO_ACCESSIBILITY
        clear_response_button->setText(QApplication::translate("MainWindow", "Clear", nullptr));
        log_tabWidget->setTabText(log_tabWidget->indexOf(Robot_Response_tab), QApplication::translate("MainWindow", "Robot_Response", nullptr));
        Connection_Status_groupBox->setTitle(QApplication::translate("MainWindow", "Connection Status", nullptr));
        SvrClient_label->setText(QApplication::translate("MainWindow", "<html><head/><body><p><span style=\" font-size:14pt; color:#ad7fa8;\">Ethernet</span></p></body></html>", nullptr));
        set_svr_re_connect_button->setText(QApplication::translate("MainWindow", "Test", nullptr));
        svrclient_status_label->setText(QApplication::translate("MainWindow", "<html><head/><body><p><span style=\" font-size:14pt; font-weight:600; color:#2e3436;\">NaN</span></p></body></html>", nullptr));
        ReConnect_label->setText(QApplication::translate("MainWindow", "<html><head/><body><p><span style=\" font-size:12pt; color:#ffffff;\">Re-Connect</span></p></body></html>", nullptr));
        SctClient_label->setText(QApplication::translate("MainWindow", "<html><head/><body><p><span style=\" font-size:14pt; color:#ad7fa8;\">Listen Node</span></p></body></html>", nullptr));
        sctclient_status_label->setText(QApplication::translate("MainWindow", "<html><head/><body><p><span style=\" font-size:14pt; font-weight:600; color:#2e3436;\">NaN</span></p></body></html>", nullptr));
        set_sct_re_connect_button->setText(QApplication::translate("MainWindow", "Test", nullptr));
        Connect_to_TM_Server_label->setText(QApplication::translate("MainWindow", "<html><head/><body><p><span style=\" font-size:12pt; color:#ffffff;\">Connection</span></p></body></html>", nullptr));
        Robot_Status_groupBox->setTitle(QString());
        Project_Run_label->setText(QApplication::translate("MainWindow", "<html><head/><body><p><span style=\" font-size:12pt; color:#eeeeec;\">Project_Run</span></p></body></html>", nullptr));
        project_run_status_label->setText(QApplication::translate("MainWindow", "<html><head/><body><p><span style=\" font-size:14pt; font-weight:600; color:#2e3436;\">NaN</span></p></body></html>", nullptr));
        Project_Pause_label->setText(QApplication::translate("MainWindow", "<html><head/><body><p><span style=\" font-size:12pt; color:#eeeeec;\">Project_Pause</span></p></body></html>", nullptr));
        project_pause_status_label->setText(QApplication::translate("MainWindow", "<html><head/><body><p><span style=\" font-size:14pt; font-weight:600; color:#2e3436;\">NaN</span></p></body></html>", nullptr));
        Robot_Link_label->setText(QApplication::translate("MainWindow", "<html><head/><body><p><span style=\" font-size:12pt; color:#eeeeec;\">Robot_Link</span></p></body></html>", nullptr));
        robot_link_status_label->setText(QApplication::translate("MainWindow", "<html><head/><body><p><span style=\" font-size:14pt; font-weight:600; color:#2e3436;\">NaN</span></p></body></html>", nullptr));
        ESTOP_label->setText(QApplication::translate("MainWindow", "<html><head/><body><p><span style=\" font-size:12pt; color:#eeeeec;\">ESTOP</span></p></body></html>", nullptr));
        estop_status_label->setText(QApplication::translate("MainWindow", "<html><head/><body><p><span style=\" font-size:14pt; font-weight:600; color:#2e3436;\">NaN</span></p></body></html>", nullptr));
        Data_Table_Correct_label->setText(QApplication::translate("MainWindow", "<html><head/><body><p><span style=\" font-size:12pt; color:#eeeeec;\">Data_Table_Correct</span></p></body></html>", nullptr));
        data_table_correct_status_label->setText(QApplication::translate("MainWindow", "<html><head/><body><p><span style=\" font-size:14pt; font-weight:600; color:#2e3436;\">NaN</span></p></body></html>", nullptr));
        Safeguard_A_label->setText(QApplication::translate("MainWindow", "<html><head/><body><p><span style=\" font-size:12pt; color:#eeeeec;\">Safeguard_A</span></p></body></html>", nullptr));
        safeguard_a_status_label->setText(QApplication::translate("MainWindow", "<html><head/><body><p><span style=\" font-size:14pt; font-weight:600; color:#2e3436;\">NaN</span></p></body></html>", nullptr));
        Robot_Error_label->setText(QApplication::translate("MainWindow", "<html><head/><body><p><span style=\" font-size:12pt; color:#eeeeec;\">Robot_Error</span></p></body></html>", nullptr));
        robot_error_status_label->setText(QApplication::translate("MainWindow", "<html><head/><body><p><span style=\" font-size:14pt; font-weight:600; color:#2e3436;\">NaN</span></p></body></html>", nullptr));
        Error_Code_label->setText(QApplication::translate("MainWindow", "<html><head/><body><p><span style=\" font-size:12pt; color:#eeeeec;\">Error_Code</span></p></body></html>", nullptr));
        error_code_status_label->setText(QApplication::translate("MainWindow", "<html><head/><body><p><span style=\" font-size:14pt; font-weight:600; color:#2e3436;\">NaN</span></p></body></html>", nullptr));
        MA_Mode_label->setText(QApplication::translate("MainWindow", "<html><head/><body><p><span style=\" font-size:12pt; color:#eeeeec;\">MA_Mode</span></p></body></html>", nullptr));
        ma_mode_label->setText(QApplication::translate("MainWindow", "<html><head/><body><p><span style=\" font-size:14pt; font-weight:600; color:#2e3436;\">NaN</span></p></body></html>", nullptr));
        configure_tabWidget->setTabText(configure_tabWidget->indexOf(Robot_Status_tab), QApplication::translate("MainWindow", "TM_Robot_Status", nullptr));
        ControlBox_groupBox->setTitle(QString());
        change_control_box_io_button->setText(QApplication::translate("MainWindow", "H / L", nullptr));
        DO0_Ctrl_label->setText(QApplication::translate("MainWindow", "<html><head/><body><p><span style=\" font-size:14pt; color:#ffffff;\">DO0 Ctrl</span></p></body></html>", nullptr));
        ctrl_do0_status_label->setText(QApplication::translate("MainWindow", "<html><head/><body><p><span style=\" font-size:14pt; font-weight:600; color:#2e3436;\">NaN</span></p></body></html>", nullptr));
        configure_tabWidget->setTabText(configure_tabWidget->indexOf(ControlBox_tab), QApplication::translate("MainWindow", "Control_Box", nullptr));
        CQ_Monitor_groupBox->setTitle(QString());
        LinkLost_label->setText(QApplication::translate("MainWindow", "<html><head/><body><p><span style=\" font-size:14pt; color:#ffffff;\">LinkLost</span></p></body></html>", nullptr));
        linklost_status_label->setText(QApplication::translate("MainWindow", "<html><head/><body><p><span style=\" font-size:14pt; font-weight:600; color:#2e3436;\">NaN</span></p></body></html>", nullptr));
        MaxLostTime_label->setText(QApplication::translate("MainWindow", "<html><head/><body><p><span style=\" font-size:14pt; color:#ffffff;\">MaxLostTime (s)</span></p></body></html>", nullptr));
        maxlosttime_status_label->setText(QApplication::translate("MainWindow", "<html><head/><body><p><span style=\" font-size:14pt; font-weight:600; color:#2e3436;\">NaN</span></p></body></html>", nullptr));
        configure_tabWidget->setTabText(configure_tabWidget->indexOf(CQ_Monitor_tab), QApplication::translate("MainWindow", "CQ Monitor", nullptr));
        Close->setText(QApplication::translate("MainWindow", "Quit_GUI", nullptr));
        Response_ROS_Node_groupBox->setTitle(QApplication::translate("MainWindow", "Response ROS Node Status", nullptr));
        TMSVR_label->setText(QApplication::translate("MainWindow", "<html><head/><body><p><span style=\" font-size:14pt; color:#ad7fa8;\">TMSVR</span></p></body></html>", nullptr));
        tmsrv_cperr_status_label->setText(QApplication::translate("MainWindow", "<html><head/><body><p><span style=\" font-size:14pt; font-weight:600; color:#2e3436;\">NaN</span></p></body></html>", nullptr));
        DataErr_label->setText(QApplication::translate("MainWindow", "<html><head/><body><p><span style=\" font-size:12pt; color:#ffffff;\">DataErr</span></p></body></html>", nullptr));
        TMScript_label->setText(QApplication::translate("MainWindow", "<html><head/><body><p><span style=\" font-size:14pt; color:#ad7fa8;\">TMSCT / TMSTA </span></p></body></html>", nullptr));
        tmscript_cperr_status_label->setText(QApplication::translate("MainWindow", "<html><head/><body><p><span style=\" font-size:14pt; font-weight:600; color:#2e3436;\">NaN</span></p></body></html>", nullptr));
        CPERR_label->setText(QApplication::translate("MainWindow", "<html><head/><body><p><span style=\" font-size:12pt; color:#ffffff;\">CPERR</span></p></body></html>", nullptr));
        tmsrv_dataerr_status_label->setText(QApplication::translate("MainWindow", "<html><head/><body><p><span style=\" font-size:14pt; font-weight:600; color:#2e3436;\">NaN</span></p></body></html>", nullptr));
        tmscript_dataerr_status_label->setText(QApplication::translate("MainWindow", "<html><head/><body><p><span style=\" font-size:14pt; font-weight:600; color:#2e3436;\">NaN</span></p></body></html>", nullptr));
    } // retranslateUi

};

namespace Ui {
    class MainWindow: public Ui_MainWindow {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_TM_ROS_DRIVER_WINDOWS_H
