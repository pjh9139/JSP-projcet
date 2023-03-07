package logistics;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CompanydetailCommand implements LogisticsInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
		
		LogisticsDAO dao = new LogisticsDAO();
		
		CompanyVO vo = dao.detailCompany(idx);
		
		request.setAttribute("vo", vo);
	}

}