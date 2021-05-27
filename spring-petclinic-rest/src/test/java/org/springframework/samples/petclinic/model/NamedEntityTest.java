package org.springframework.samples.petclinic.model;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

public class NamedEntityTest {
    @Test
    public void testName() {
        NamedEntity name = new NamedEntity();
        String expected = "Jonnas";
        name.setName("Jonnas");
        Assertions.assertEquals(expected, name.getName());
        Assertions.assertEquals(expected, name.toString());
    }

}
