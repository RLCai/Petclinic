package org.springframework.samples.petclinic.model;

import org.junit.Test;
import org.junit.jupiter.api.Assertions;

import java.util.HashSet;
import java.util.Set;


public class VetTest {
    Vet vetTest = new Vet();
    Specialty surgery = new Specialty();

    @Test
    public void getNrOfSpec() {
        surgery.setName("Surgery");
        Assertions.assertEquals(0, vetTest.getNrOfSpecialties());
        vetTest.addSpecialty(surgery);
        Assertions.assertEquals(1, vetTest.getNrOfSpecialties());
    }
    @Test
    public void addSpec() {
        surgery.setName("Surgery");
        vetTest.addSpecialty(surgery);
        Assertions.assertEquals(1, vetTest.getNrOfSpecialties());
    }
    @Test
    public void clearSpec() {
        surgery.setName("Surgery");
        vetTest.addSpecialty(surgery);
        Assertions.assertEquals(1, vetTest.getNrOfSpecialties());
        vetTest.clearSpecialties();
        Assertions.assertEquals(0, vetTest.getNrOfSpecialties());
    }
    @Test
    public void testsetSpecialtiesInternal(){
        Vet vetTest = new Vet();
        Specialty type1 = new Specialty();
        type1.setName("Surgery");
        vetTest.addSpecialty(type1);
        Set<Specialty> temp = new HashSet<>();
        temp.add(type1);
        vetTest.setSpecialtiesInternal(temp);
        Assertions.assertTrue (vetTest.getSpecialties().contains(type1) );
    }

}
