package marcos.demo.controlador;

import java.util.Map;

import marcos.demo.form.Contacto;
import marcos.demo.servicio.ServicioContacto;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ControladorContacto {
	
	@Autowired
	private ServicioContacto servicioContacto;
	
	@RequestMapping("/")
	 public String listContacts(Map<String, Object> map) {
		
		
		map.put("contacto", new Contacto());
		map.put("contactoList", servicioContacto.listContact());
				
		return "contacto";
	 }
	
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	 public String addContacto(@ModelAttribute("contacto") Contacto contacto, BindingResult result) {

		servicioContacto.addContact(contacto);
		
		return "redirect:/";
	 }
	
	@RequestMapping("/delete/{contactId}")
	 public String deleteContact(@PathVariable("contactId") Integer contactId) {
		
		servicioContacto.removeContact(contactId);
		
		return "redirect:/";
	 }
	
	@RequestMapping("/update/{contactId}")
	 public ModelAndView updateContact(@PathVariable("contactId") Integer contactId) {
		
		ModelAndView mav = new ModelAndView("contactoUpdate");
		Contacto contacto = servicioContacto.getContactoId(contactId);
		mav.addObject("lista", contacto);
		System.out.println("Cantidad: "+contacto.getNombre());
		System.out.println("CantidadIS: "+mav.isEmpty());
		
		return mav;
	 }
	
	@RequestMapping(value="update",method = RequestMethod.POST)
	 public String updateContacts(@ModelAttribute("contacto") Contacto contacto, BindingResult result) {
		
		servicioContacto.updateContact(contacto);
		
		return "redirect:/";
	 }
}
