package org.springframework.samples.petclinic.model;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.format.annotation.DateTimeFormat;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class PetTest {
    @Temporal(TemporalType.DATE)
    @DateTimeFormat
    @Test
    public void testBirthDate() {
        Pet p = new Pet();
        Date expected = new Date("2020/10/10");
        p.setBirthDate(new Date("2020/10/10"));
        Assertions.assertEquals(expected, p.getBirthDate());
    }
    @Test
    public void testType() {
        Pet p = new Pet();
        PetType pt = new PetType();
        pt.setName("cat");
        p.setType(pt);
        Assertions.assertEquals("cat", p.getType().getName());
        //another method
        //NamedEntity name = new PetType();
        //name.setName("cat");
        //p.setType((PetType)name);
        //Assertions.assertEquals("cat", p.getType().getName());
    }

    @Test
    public void testOwner() {
        Pet p = new Pet();
        Owner ownercity = new Owner();
        ownercity.setCity("Gothenburg");
        p.setOwner(ownercity);
        Assertions.assertEquals("Gothenburg", p.getOwner().getCity());
    }

    @Test
    public void testVisit_WhenVisitSetIsNull() {
        Pet p = new Pet();
        Visit v = new Visit();
        p.addVisit(v);
        v.setDescription("vaccination");
        Owner ownercity = new Owner();
        ownercity.setCity("Gothenburg");
        p.setOwner(ownercity);
        Assertions.assertEquals("vaccination", p.getVisits().get(0).getDescription());
        Assertions.assertEquals("Gothenburg", p.getVisits().get(0).getPet().getOwner().getCity());
    }

    @Test
    public void testVisit_WhenVisitSetIsNotNull() {
        Pet p = new Pet();
        Visit v = new Visit();
        Set<Visit> visits = new HashSet<>();
        p.setVisitsInternal(visits);
        p.addVisit(v);
        v.setDescription("vaccination");
        Assertions.assertEquals("vaccination", p.getVisits().get(0).getDescription());
    }
}
