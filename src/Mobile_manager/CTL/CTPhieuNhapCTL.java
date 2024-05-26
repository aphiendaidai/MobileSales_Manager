package Mobile_manager.CTL;

import java.util.ArrayList;

import Mobile_manager.DAO.CTPhieuNhapDAO;
import Mobile_manager.Model.CTPhieuNhap;

public class CTPhieuNhapCTL {

    private ArrayList<CTPhieuNhap> listPhieuNhap = null;
    private CTPhieuNhapDAO ctPhieuNhapDAO = new CTPhieuNhapDAO();

    public CTPhieuNhapCTL() {
        docDanhSach();
    }

    public void docDanhSach() {
        this.listPhieuNhap = ctPhieuNhapDAO.getListCTPhieuNhap();
    }

    public ArrayList<CTPhieuNhap> getListPhieuNhap() {
        if (listPhieuNhap == null) {
            docDanhSach();
        }
        return listPhieuNhap;
    }
    
    public ArrayList<CTPhieuNhap> getListPhieuNhap(String maPN) {
        ArrayList<CTPhieuNhap> dsct = new ArrayList<>();
        int ma = Integer.parseInt(maPN);
        
        for(CTPhieuNhap ct: listPhieuNhap) {
            if(ct.getMaPN() == ma) {
                dsct.add(ct);
            }
        }
        
        return dsct;
    }

    public boolean luuCTPhieuNhap(CTPhieuNhap ctpn) {
        return ctPhieuNhapDAO.addCTPhieuNhap(ctpn);
    }
}
