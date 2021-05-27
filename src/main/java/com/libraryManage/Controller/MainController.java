package com.libraryManage.Controller;

import org.springframework.stereotype.*;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class MainController {
	@GetMapping("/")
	public String index(Model model) {
		return "index";
	}
	
	@GetMapping("/admin_index")
	public String admin_index() {
		return "admin_index";
	}
}