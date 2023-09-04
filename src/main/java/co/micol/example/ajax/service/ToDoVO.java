package co.micol.example.ajax.service;

import java.time.LocalDate;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ToDoVO {
	private int num;
	private String todo;
	private LocalDate duedate;
	private String complete;
}
