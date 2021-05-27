package org.springframework.samples.petclinic.model;

import org.junit.Test;
import org.junit.jupiter.api.Assertions;
import java.util.Date;

public class VisitTest {
@Test
    public void testDate(){
    Visit V = new Visit();
    Date expected= new Date("2002/01/01");
    V.setDate( new Date("2002/01/01"));
    Assertions.assertEquals(expected, V.getDate());
                          }
@Test
    public void testDescription(){
    Visit V = new Visit();
    String expected = "Soft Wound";
    V.setDescription("Soft Wound");
    Assertions.assertEquals(expected,V.getDescription());
                                 }
@Test
    public void testPet(){
     Pet P = new Pet();
     Visit V = new Visit();
     String expected = "Kitty";
     P.setName("Kitty");
     V.setPet(P);
     Assertions.assertEquals(expected, V.getPet().getName());
                       }
}



