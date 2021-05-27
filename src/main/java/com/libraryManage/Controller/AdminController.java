package com.libraryManage.Controller;

import javax.servlet.http.HttpSession;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.libraryManage.Service.*;

@Controller
@RequestMapping(value = "/admin/*")
public class AdminController {
	@Autowired
	MemberService memberService;

	// 도서 추가용
	@GetMapping("/book/add")
	public String admin_book_add() {
		return "admin_book_add";
	}

	// 도서 삭제용
	@GetMapping("/book/delete")
	public String admin_book_delete() {
		return "admin_book_delete";
	}

	@GetMapping("/logout")
	public String member_logout(final HttpSession session) {
		if (session.getAttribute("auth") != null)
			session.removeAttribute("auth");

		if (session.getAttribute("memberId") != null)
			session.removeAttribute("memberId");

		return "index";
	}
}
