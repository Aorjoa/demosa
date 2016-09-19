// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package th.ac.sut.pizza.web;

import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;
import th.ac.sut.pizza.domain.Topping;
import th.ac.sut.pizza.web.ToppingController;

privileged aspect ToppingController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String ToppingController.create(@Valid Topping topping, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, topping);
            return "toppings/create";
        }
        uiModel.asMap().clear();
        topping.persist();
        return "redirect:/toppings/" + encodeUrlPathSegment(topping.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String ToppingController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Topping());
        return "toppings/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String ToppingController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("topping", Topping.findTopping(id));
        uiModel.addAttribute("itemId", id);
        return "toppings/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String ToppingController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("toppings", Topping.findToppingEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) Topping.countToppings() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("toppings", Topping.findAllToppings(sortFieldName, sortOrder));
        }
        return "toppings/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String ToppingController.update(@Valid Topping topping, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, topping);
            return "toppings/update";
        }
        uiModel.asMap().clear();
        topping.merge();
        return "redirect:/toppings/" + encodeUrlPathSegment(topping.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String ToppingController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Topping.findTopping(id));
        return "toppings/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String ToppingController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Topping topping = Topping.findTopping(id);
        topping.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/toppings";
    }
    
    void ToppingController.populateEditForm(Model uiModel, Topping topping) {
        uiModel.addAttribute("topping", topping);
    }
    
    String ToppingController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
