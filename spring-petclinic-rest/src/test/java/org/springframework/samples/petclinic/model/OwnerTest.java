package org.springframework.samples.petclinic.model;

import org.junit.Test;
import org.junit.jupiter.api.Assertions;
import java.util.HashSet;
import java.util.Set;

public class OwnerTest {

    @Test
    public void testGetAddress(){
        Owner owner = new Owner();
        String expected = "abcvagen123";
        owner.setAddress("abcvagen123");
        Assertions.assertEquals(expected,owner.getAddress());
    }
    @Test
    public void testGetCity(){
        Owner owner = new Owner();
        String expected = "Göteborg";
        owner.setCity("Göteborg");
        Assertions.assertEquals(expected,owner.getCity());
    }
    @Test
    public void testGetTelephone(){
        Owner owner = new Owner();
        String expected = "12345678";
        owner.setTelephone("12345678");
        Assertions.assertEquals(expected,owner.getTelephone());
    }
    @Test
    public void testGetPet(){
        Owner owner = new Owner();
        Pet pet = new Pet();
        String expected = "Kitty";
        owner.addPet(pet);
        pet.setName("Kitty");
        Assertions.assertEquals(expected ,pet.getName());
    }
    @Test
    public void testSetPetsInternal(){
    Owner owner = new Owner();
    Pet pet = new Pet();
    pet.setName("dog");
    Pet pet2 = new Pet();
    pet2.setName("cat");
    Set<Pet> temp = new HashSet<>();
    temp.add(pet);
    temp.add(pet2);
    owner.setPetsInternal(temp);
    Pet returned = owner.getPet("cat", false);
    String nameOfPet = null;
    if(returned != null){
        nameOfPet = returned.getName();
    }
    Assertions.assertEquals("cat", nameOfPet);


    }
    @Test
    public void testGetPetsListSortedByName(){
        Owner owner = new Owner();
        Pet pet = new Pet();
        Pet pet1 = new Pet();
        owner.addPet(pet);
        owner.addPet(pet1);
        pet.setName("Kiwi");
        pet1.setName("Charlie");
        String firstNameExpected = "Charlie";
        Assertions.assertEquals(firstNameExpected, owner.getPets().get(0).getName());

    }
    @Test
    public void testGetPetShouldAlwaysReturnPetObject(){
        Owner owner = new Owner();
        Pet pet = new Pet();
        owner.addPet(pet);
        pet.setName("MATTIAS");
        Assertions.assertEquals(pet,owner.getPet("Mattias"));
    }
    @Test
    public void testGetPetShouldReturnPetObject(){
        Owner owner = new Owner();
        Pet pet = new Pet();
        owner.addPet(pet);
        pet.setName("MATTIAS");
        pet.setId(1);
        Assertions.assertEquals(pet,owner.getPet("Mattias",true));
    }
    @Test
    public void testGetPetShouldReturnNull(){
        Owner owner = new Owner();
        Pet pet = new Pet();
        owner.addPet(pet);
        pet.setName("MATTIAS");
        Assertions.assertNull(owner.getPet("Mattias",true));
    }

    @Test
    public void testToString(){
        Owner owner = new Owner();
        String expected = "" +
            "id = 1, " +
            "new = false, " +
            "lastName = 'Hovde', " +
            "firstName = 'Mattias', " +
            "address = 'abc123', " +
            "city = 'Göteborg', " +
            "telephone = '12345'";
        owner.setFirstName("Mattias");
        owner.setLastName("Hovde");
        owner.setId(1);
        owner.setCity("Göteborg");
        owner.setAddress("abc123");
        owner.setTelephone("12345");
        Assertions.assertTrue(owner.toString().contains(expected));
    }

}
