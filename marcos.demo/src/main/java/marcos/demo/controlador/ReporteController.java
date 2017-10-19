package marcos.demo.controlador;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import marcos.demo.dto.ReportParams;
import marcos.demo.utils.ReporteUtils;

@Controller
@RequestMapping("reporte")
public class ReporteController {

	@Autowired
	private ReporteUtils reporteUtils;
	
	
	@RequestMapping("/show")
	public String createPDF(Model model) {
		
		ReportParams reporte = new ReportParams();
		
		reporte.setNombre("nominaPersonal");
		reporte.setNombreReporte("nominaPersonal.jasper");
		
		model.addAttribute("reporte", reporte);
		
		return "reporte/nomina";
	}

	@RequestMapping("/create")
	public String createPDF(@ModelAttribute("report") ReportParams params, HttpServletRequest request,
			HttpServletResponse response) {

		ServletContext context = request.getServletContext();
		ServletOutputStream out = null;

		try {

			byte[] bytes = reporteUtils.generateReporte(params.getNombre(), context);
			response.setContentType("application/pdf");
			response.setContentLength(bytes.length);
			out = response.getOutputStream();
			out.write(bytes, 0, bytes.length);

		} catch (Exception ex) {
			System.out.println(params.getNombre() + " - error al escribir los bytes a la salida: " + ex.getMessage());
		}finally{
			if(out != null){
				try {
					out.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}

		return null;
	}

}
