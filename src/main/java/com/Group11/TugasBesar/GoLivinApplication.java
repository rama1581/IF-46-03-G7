package com.Group11.TugasBesar;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
@ComponentScan("com.Group11.TugasBesar")
public class GoLivinApplication {

	public static void main(String[] args) {
		SpringApplication.run(GoLivinApplication.class, args);
	}
}
