package th.ac.sut.pizza.web;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import th.ac.sut.pizza.domain.Base;

@RequestMapping("/bases")
@Controller
@RooWebScaffold(path = "bases", formBackingObject = Base.class)
public class BaseController {
}
