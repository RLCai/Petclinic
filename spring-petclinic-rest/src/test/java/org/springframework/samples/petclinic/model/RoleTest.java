package org.springframework.samples.petclinic.model;

import org.junit.Test;
import org.junit.jupiter.api.Assertions;

public class RoleTest {
    @Test
    public void testgetUser() {
        Role R = new Role();
        User user = new User();
        user.setUsername("Subha");
        R.setUser(user);
        Assertions.assertEquals(user.getUsername(), R.getUser().getUsername());
    }

    @Test
    public void testgetUsernull() {
        Role R = new Role();
        Assertions.assertEquals(null, R.getUser());
    }

    @Test
    public void testgetName() {
        Role R = new Role();
        String expected = "subha";
        R.setName("subha");
        Assertions.assertEquals(expected , R.getName());
    }

}
