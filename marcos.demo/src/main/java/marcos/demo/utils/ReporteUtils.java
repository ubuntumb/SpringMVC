package marcos.demo.utils;

import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Component;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRRuntimeException;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.JasperRunManager;
import net.sf.jasperreports.engine.util.JRLoader;

@Component
@PropertySource(value = { "classpath:application.properties" })
public class ReporteUtils {

	@Autowired
	private Environment env;

	public byte[] generateReporte(String nombreReporte, ServletContext context) {

		Connection con = createConnection();

		String pathReporte = context.getRealPath("reportes/" + nombreReporte);
		String path_logotipo = context.getRealPath("resources/images/logo1.jpg");

		try {
			System.out.println("Conn: " + con.getMetaData().getDatabaseProductName());
		} catch (SQLException e1) {
			e1.printStackTrace();
		}

		File reporte = new File(pathReporte);

		if (reporte.exists()) {

			JasperReport masterReport = null;

			try {

				masterReport = (JasperReport) JRLoader.loadObject(reporte);

			} catch (JRException e) {

				System.out.println(nombreReporte + " - Error cargando el reporte: " + e.getMessage());
				System.exit(3);
			}

			byte[] bytes = null;
			Map<String, Object> masterParams = new HashMap<String, Object>();
			
			masterParams.put("img_left", path_logotipo);
			

			try {
				bytes = JasperRunManager.runReportToPdf(reporte.getPath(), masterParams, con);
				con.close();
			} catch (JRException | SQLException jrex) {
				
				System.out.println(nombreReporte + " - error al exportar el reporte a PDF: " + jrex.getMessage());
			}

			return bytes;

		} else {
			throw new JRRuntimeException("No se encuentra el archivo del reporte " + pathReporte);
		}

	}

	private Connection createConnection() {
		Connection con = null;
		try {
			con = DriverManager.getConnection(env.getProperty("jdbc.url"), env.getProperty("jdbc.username"),
					env.getProperty("jdbc.password"));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}
}
