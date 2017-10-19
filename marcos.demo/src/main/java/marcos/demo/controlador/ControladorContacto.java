package marcos.demo.controlador;

import java.util.List;
import java.util.Locale;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import marcos.demo.entity.Contacto;
import marcos.demo.servicio.ServicioContacto;

@Controller
@RequestMapping("/contacto")
public class ControladorContacto {

	@Autowired
	private ServicioContacto servicioContacto;

	@Autowired
	private ApplicationContext context;

	@RequestMapping("/index")
	public String listContacto(Model model) {

		List<Contacto> contactos = servicioContacto.getAll();
		model.addAttribute("contactos", contactos);

		return "contacto/index";
	}

	@RequestMapping(value = "/show/{id}", method = { RequestMethod.POST, RequestMethod.GET })
	public String showContacto(@PathVariable("id") Integer contactId, Model model) {

		Contacto contacto = servicioContacto.getById(contactId);
		model.addAttribute("contacto", contacto);

		return "contacto/show";

	}

	@RequestMapping(value = "/create", method = { RequestMethod.POST, RequestMethod.GET })
	public String createContacto(Model model) {

		Contacto contacto = new Contacto();
		model.addAttribute("contacto", contacto);

		return "contacto/create";

	}

	@RequestMapping(value = "/edit/{id}", method = { RequestMethod.POST, RequestMethod.PUT, RequestMethod.GET })
	public String editContacto(@PathVariable("id") Integer contactoId, Model model) {

		Contacto contacto = servicioContacto.getById(contactoId);
		model.addAttribute("contacto", contacto);

		return "contacto/edit";

	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String saveContacto(@Valid Contacto contacto, BindingResult result, ModelMap model) {

		if (!result.hasErrors()) {

			model.addAttribute("message", context.getMessage("default.created.message",
					new Object[] { "Persona:", contacto.getNombre() }, Locale.US));
			model.addAttribute("alert", "alert-success");
			
			servicioContacto.add(contacto);
			
			model.addAttribute("contacto", contacto);
			
			return "contacto/show";
		}else{
			model.addAttribute("contacto", contacto);
			return "contacto/create";
		}

	}

	@RequestMapping(value = "/delete/{id}", method = { RequestMethod.POST, RequestMethod.DELETE })
	public String deleteContacto(@PathVariable("id") Integer contactId, Model model) {

		Contacto contacto = servicioContacto.getById(contactId);
		model.addAttribute("message", context.getMessage("default.deleted.message",
				new Object[] { "Persona:", contacto.getNombre() }, Locale.US));
		model.addAttribute("alert", "alert-success");

		servicioContacto.remove(contactId);
		
		List<Contacto> contactos = servicioContacto.getAll();
		model.addAttribute("contactos", contactos);

		return "contacto/index";
	}

	@RequestMapping(value = "/update", method = { RequestMethod.POST, RequestMethod.PUT })
	public String updateContacto(@Valid Contacto contacto, BindingResult result, ModelMap model) {

		if (!result.hasErrors()) {

			model.addAttribute("message", context.getMessage("default.updated.message",
					new Object[] { "Persona:", contacto.getNombre() }, Locale.US));
			model.addAttribute("alert", "alert-success");
			model.addAttribute("contacto", contacto);
			
			servicioContacto.update(contacto);
			return "contacto/show";
			
		}else{
			model.addAttribute("contacto", contacto);
			return "contacto/edit";
		}

		
	}
}
