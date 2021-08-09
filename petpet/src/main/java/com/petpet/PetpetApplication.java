package com.petpet;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import it.ozimov.springboot.mail.configuration.EnableEmailTools;

@SpringBootApplication
@EnableEmailTools
public class PetpetApplication {

	public static void main(String[] args) {
		SpringApplication.run(PetpetApplication.class, args);
	}

}
