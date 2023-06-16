package com.example._2_23Project;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.client.HttpServerErrorException;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {
	@RequestMapping("/home")
	public String home(HttpServletRequest req) {	
		HttpSession session = req.getSession();
		String name = req.getParameter("name");
		System.out.println("hi "+ name);
		session.setAttribute("name", name);
		return "home.jsp";
	}
	@RequestMapping("/home1")
	public String home1(HttpServletRequest req) {
		HttpSession session = req.getSession();
		String name = req.getParameter("name");                                                                                                                             
		System.out.println("hi "+ name);
		session.setAttribute("name", name);
		return "home1.jsp";	
	}
	
//	@RequestMapping("/hi")
//	public String about(@RequestParam("name") String about, HttpSession session) {
//		System.out.println("hi "+ about);
//		session.setAttribute("about", about);
//		return "about.jsp"; 
//	}
	@RequestMapping("/demo")
	public ModelAndView demo(@RequestParam("aname") String demo) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("name", demo);
		mv.setViewName("demo.jsp");
		return mv;
	}
	@RequestMapping("/contact")
	public String contact() {
		System.out.println("hi");
		return "contact.jsp";
	}
	@RequestMapping("/page1")
	public String page1() {
		System.out.println("hi");
		return "page1.jsp";
	}
//	@RequestMapping("/alien")
//	public ModelAndView demo(Alien alien) {
//		ModelAndView mv = new ModelAndView();
//		mv.addObject("obj", alien);
//		mv.setViewName("alien.jsp");
//		return mv;
//	}
	@RequestMapping("/form")
	public String loginpage() {
		System.out.println("form");
		return "Form.jsp";
	}
	@RequestMapping("/MutualFundLumpsumCalculator")
	public String MutualFundLumpsumCalculator() {
		System.out.println("MutualFundLumpsumCalculator");
		return "MutualFundLumpsumCalculator.jsp";
	}
	
	@RequestMapping("/about")
	public String about() {
		System.out.println("about");
		return "about.jsp";
	}
	@RequestMapping("/formResult")
	public String formResult() {
		System.out.println("formResult");
		return "formResult.jsp";
	}
	@RequestMapping("/showMapTileBounds")
	public String showMapTilebounds() {
		System.out.println("showMapTileBounds");
		return "showMapTileBounds.jsp";
	}
	@RequestMapping("/form1")
	public String form1() {
		System.out.println("form1");
		return "form1.jsp";
	}
	@RequestMapping("/index")
	public String index() {
		System.out.println("index");
		return "index.jsp";
	}
	@RequestMapping("/TextFileReader")
	public String TextFileReader() {
		System.out.println("TextFileReader");
		return "TextFileData.jsp";
	}
}
