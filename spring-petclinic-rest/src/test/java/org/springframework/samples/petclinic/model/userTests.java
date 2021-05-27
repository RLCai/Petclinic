package org.springframework.samples.petclinic.model;

import org.junit.Test;
import org.junit.jupiter.api.Assertions;


import java.util.HashSet;
import java.util.Set;

import static org.assertj.core.api.Assertions.assertThat;


public class userTests {
    private User underTest;




    @Test
    public void testgetUsername() {
        User fn = new User();
        String expected = "Likkaa";
        fn.setUsername("Likkaa");
        Assertions.assertEquals(expected, fn.getUsername());
    }
    @Test
    public void testgetPassword() {
        User pw = new User();
        String expected = "password123";
        pw.setPassword("password123");
        Assertions.assertEquals(expected, pw.getPassword());
    }
    @Test
    public void testEnabled(){
        //given
        boolean name = true;
        User us =new User();

        //when

        //then
        us.setEnabled(true);

        Assertions.assertEquals(true,us.getEnabled());

    }
    @Test
    public void testSetRole(){
        User us = new User();
        Role name = new Role();
        name.setName("mattias");
        Set<Role> r = new HashSet<>();
        r.add(name);
        us.setRoles(r);
        Assertions.assertTrue(us.getRoles().iterator().next().getName().contains("mattias"));
    }


    @Test
    public void testaddRole() {
        User user = new User();

        user.setUsername("subha");
        user.addRole("Admin");
        Assertions.assertTrue(user.getRoles().iterator().next().getName().contains("Admin"));

    }
}
