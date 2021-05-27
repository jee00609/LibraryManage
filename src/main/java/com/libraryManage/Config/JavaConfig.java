package com.libraryManage.Config;

import javax.sql.DataSource;
import org.springframework.context.annotation.*;
import org.springframework.jdbc.datasource.*;

@Configuration
@ComponentScan("com.libraryManage")
public class JavaConfig {
	@Bean
	public DataSource dataSource() {
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName("com.mysql.cj.jdbc.Driver");
		dataSource.setUrl("jdbc:mysql://localhost:3306/spring5fs?autoReconnect=true");
		dataSource.setUsername("root");
		dataSource.setPassword("rootoor");
		return dataSource;
	}
}
