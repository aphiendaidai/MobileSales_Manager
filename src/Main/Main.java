package Main;

import Mobile_manager.DAO.MyConnect;
import Mobile_manager.View.DangNhapView;

public class Main {

    public static void main(String[] args) {
        new MyConnect();

        changLNF("Nimbus");
        DangNhapView login = new DangNhapView();
        login.showWindow();
    }

    public static void changLNF(String nameLNF) {
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if (nameLNF.equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | javax.swing.UnsupportedLookAndFeelException ex) {
        }
    }
}
