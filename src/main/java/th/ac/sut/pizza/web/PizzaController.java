package th.ac.sut.pizza.web;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import th.ac.sut.pizza.domain.Pizza;

@RequestMapping("/pizzas")
@Controller
@RooWebScaffold(path = "pizzas", formBackingObject = Pizza.class)
public class PizzaController {
}
