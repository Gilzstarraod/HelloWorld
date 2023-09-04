package co.micol.example.ajax.service;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class MembersVO {
	private int mbrId;
	private String mbrName;
	private String mbrPhone;
	private int mbrAge;
}
