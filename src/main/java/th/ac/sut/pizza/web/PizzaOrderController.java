package th.ac.sut.pizza.web;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.ui.Model;
import flexjson.JSONSerializer;
import th.ac.sut.pizza.domain.Pizza;
import java.util.List;
import th.ac.sut.pizza.domain.PizzaOrder;

@RequestMapping("/pizzaorders")
@Controller
@RooWebScaffold(path = "pizzaorders", formBackingObject = PizzaOrder.class)
public class PizzaOrderController {
	@RequestMapping(value = "find_pizza",method = RequestMethod.GET, produces="text/html")
    public ResponseEntity<String> findPizza(Model uiModel, @RequestParam(value = "pizza", required = false) String pizza) {
       List<Pizza> listPizza = Pizza.findPizzasByNameLike(pizza).getResultList();
       return  new ResponseEntity<String>(new JSONSerializer().exclude("*.class").deepSerialize(listPizza), HttpStatus.OK);
    }
}
