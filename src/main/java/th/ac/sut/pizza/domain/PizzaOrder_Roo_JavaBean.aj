// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package th.ac.sut.pizza.domain;

import java.util.Date;
import java.util.Set;
import th.ac.sut.pizza.domain.Pizza;
import th.ac.sut.pizza.domain.PizzaOrder;

privileged aspect PizzaOrder_Roo_JavaBean {
    
    public String PizzaOrder.getName() {
        return this.name;
    }
    
    public void PizzaOrder.setName(String name) {
        this.name = name;
    }
    
    public String PizzaOrder.getAddress() {
        return this.address;
    }
    
    public void PizzaOrder.setAddress(String address) {
        this.address = address;
    }
    
    public Float PizzaOrder.getTotal() {
        return this.total;
    }
    
    public void PizzaOrder.setTotal(Float total) {
        this.total = total;
    }
    
    public Date PizzaOrder.getDeliveryDate() {
        return this.deliveryDate;
    }
    
    public void PizzaOrder.setDeliveryDate(Date deliveryDate) {
        this.deliveryDate = deliveryDate;
    }
    
    public Set<Pizza> PizzaOrder.getPizzas() {
        return this.pizzas;
    }
    
    public void PizzaOrder.setPizzas(Set<Pizza> pizzas) {
        this.pizzas = pizzas;
    }
    
}
