package com.example.userAccount;

import com.example.userAccount.Models.User;
import com.example.userAccount.controller.UserController;
import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import java.time.LocalDate;

@SpringBootTest

class UserAccountApplicationTests {
//	@Autowired
//	private UserController userapi;
//	@Test
//	public void userCanBeAddedToTheSystem() {
//		//given
//		User user = new User();
//		user.setFirstname("Ahmad");
//		user.setLastname("Ahmadi");
//		user.setDob(LocalDate.parse("2010-02-03"));
//		user.setEmail("ahmad@gmail.com");
//		User user2 = new User();
//		user2.setFirstname("Ahmad");
//		user2.setLastname("Ahmadi");
//		user2.setDob(LocalDate.parse("2007-02-03"));
//		user2.setEmail("ahmad@gmail.com");
//		//when
//		ResponseEntity<User> result = userapi.saveUser(user);
//		ResponseEntity<User> result2 = userapi.saveUser(user2);
//		//Then
//		Assertions.assertThat(result.getStatusCode()).isEqualTo(HttpStatus.CREATED);
//		Assertions.assertThat(result2.getStatusCode()).isEqualTo(HttpStatus.CREATED);
//	}

}
