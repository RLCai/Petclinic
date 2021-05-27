package org.springframework.samples.petclinic.model;

import org.junit.Test;
import org.junit.jupiter.api.Assertions;

public class PersonTest {
    @Test
    public void testgetfirstName() {
        Person P = new Person();
        String expected = "Akshaj";
        P.setFirstName("Akshaj");
        Assertions.assertEquals(expected, P.getFirstName());
    }
    @Test
    public void testgetlastName() {
        Person P = new Person();
        String expected = "Varma";
        P.setLastName("Varma");
        Assertions.assertEquals(expected, P.getLastName());
    }

    @Test
    public void testgetfirstNamenull() {
        Person P = new Person();
        Assertions.assertEquals(null, P.getFirstName());
    }
    @Test
    public void testgetlastNamenull() {
        Person P = new Person();
        String expected = null;
        Assertions.assertEquals(expected, P.getLastName());
    }
}
