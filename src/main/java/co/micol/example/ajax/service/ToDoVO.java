package co.micol.example.ajax.service;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ToDoVO {
	private int num;
	private String todo;
	private String duedate;
	private String complete;
}
