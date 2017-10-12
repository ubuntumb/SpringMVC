package marcos.demo.controlador;

import java.util.Map;

import marcos.demo.entity.Contacto;
import marcos.demo.servicio.ServicioContacto;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/contacto")
public class ControladorContacto {

	private ModelMap modelo = new ModelMap();
	private Contacto contact = new Contacto();

	@Autowired
	private ServicioContacto servicioContacto;

	@RequestMapping("/index")
	public String listContacts(Map<String, Object> map) {

		if (modelo.isEmpty()) {
			
			contact.setId(-1);
			map.put("contacto", contact);
			
		} else {
			
			map.putAll(modelo);
			modelo.clear();
		}

		map.put("contactoList", servicioContacto.getAll());

		return "contacto/index";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addContacto(@ModelAttribute("contacto") Contacto contacto,
			BindingResult result) {

		if (contacto.getId() >= 1) {

			servicioContacto.update(contacto);

		} else {
			servicioContacto.add(contacto);
		}

		return "redirect:/";
	}

	@RequestMapping("/delete/{contactId}")
	public String deleteContact(@PathVariable("contactId") Integer contactId) {

		servicioContacto.remove(contactId);

		return "redirect:/";
	}

	@RequestMapping("/update/{contactId}")
	public String updateContact(@PathVariable("contactId") Integer contactId) {

		/*
		 * ModelAndView mav = new ModelAndView("contactoUpdate"); Contacto
		 * contacto = servicioContacto.getContactoId(contactId);
		 * mav.addObject("lista", contacto);
		 * System.out.println("Cantidad: "+contacto.getNombre());
		 * System.out.println("CantidadIS: "+mav.isEmpty());
		 */
		// modelo = new ModelMap();
		modelo.put("contacto", servicioContacto.getById(contactId));

		return "redirect:/";
	}

	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String updateContacts(@ModelAttribute("contacto") Contacto contacto,
			BindingResult result) {

		servicioContacto.update(contacto);

		return "redirect:/";
	}
}
