package com.hnb.admin;

public class SqlSessionFactoryBean {
	BasicData datasource;
	Mappers mapperlocations;
	MemberVO member;
	public Mapper getResult(String mapper) {
		switch (mapper) {
		case "memberMapper.xml":
			member = "select*from member";
			object = member;
			break;
			
		case "":

		default:
			break;
		}
		return object; // 결과값을 받아 mapperlocations에 저장하는 형태.
	}
}

class SqlSessionTemplate{
	FactoryBean bean;

	public SqlSessionTemplate(FactoryBean bean) {
		this.bean = bean;
	}
	
	
}