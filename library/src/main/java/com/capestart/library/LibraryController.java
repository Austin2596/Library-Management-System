package com.capestart.library;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

@Controller
public class LibraryController {
	@Autowired
	LibraryService libraryservice;
	
	@RequestMapping(value="/loginUser",method=RequestMethod.POST)
	public ModelAndView loginUser(@ModelAttribute LibraryModel libraryModel,String userName,String password,HttpServletRequest httpServletRequest , HttpServletResponse httpServletResponse) throws IOException
	{
		HttpSession session= httpServletRequest.getSession() ;
		ModelAndView mav= null;
		System.out.println("welcome");
		List<Map<String, Object>> validateUser = new LinkedList<Map<String,Object>>();
		//ModelAndView mav= new ModelAndView();
		System.out.println("welcome");
		libraryModel.setUserName(userName);
		libraryModel.setPassword(password);
		
		validateUser=	libraryservice.validateUser(libraryModel);
		if(validateUser.size()!=0)
		{
			
			mav =  new ModelAndView("redirect:/menu.jsp");
			
session.setAttribute("userId", userName);
session.setAttribute("adminFlag", validateUser.get(0).get("adminFlag"));
mav.addObject("userId",userName);
mav.addObject("adminFlag",validateUser.get(0).get("adminFlag"));


		}
		else
		{
			mav =  new ModelAndView("login");
			 mav.addObject("message", "Username or Password is wrong!!");

		}
	
		return mav;
	}

	
	

	@RequestMapping(value="/logout",method=RequestMethod.POST)
	public ModelAndView logout(@ModelAttribute LibraryModel libraryModel,String userName,String password,HttpServletRequest httpServletRequest , HttpServletResponse httpServletResponse) throws IOException
	{
		HttpSession session= httpServletRequest.getSession() ;
		
		session.invalidate();
		ModelAndView modelAndView =  new ModelAndView("redirect:/index.jsp");
		return modelAndView;
	}


	@RequestMapping(value="/menu",method=RequestMethod.POST)
	public ModelAndView menu(@ModelAttribute LibraryModel libraryModel,String userName,String password,HttpServletRequest httpServletRequest , HttpServletResponse httpServletResponse) throws IOException
	{
		HttpSession session= httpServletRequest.getSession() ;
		libraryModel.setUserName((String) session.getAttribute("userId"));
		libraryModel.setAdminFlag((String) session.getAttribute("adminFlag"));
		ModelAndView modelAndView =  new ModelAndView("redirect:/menu.jsp");
		modelAndView.addObject("userId",userName);
		modelAndView.addObject("adminFlag",libraryModel.getAdminFlag());
		return modelAndView;
	}
	
	
	@RequestMapping(value="/addBooks",method=RequestMethod.POST)
	public ModelAndView redirectBook(HttpServletRequest httpServletRequest , HttpServletResponse httpServletResponse)
	{
	
		ModelAndView modelAndView =  new ModelAndView("redirect:/menu.jsp");

		return modelAndView;
	}
	
	
	@RequestMapping(value="/addBookList",method=RequestMethod.POST)
	public void addBookList(@ModelAttribute LibraryModel libraryModel,String bookName,String bookPrice,String authorName ,String publisherName,String category,HttpServletRequest httpServletRequest , HttpServletResponse httpServletResponse) throws IOException
	{
		HttpSession session= httpServletRequest.getSession() ;
		libraryModel.setUserName((String) session.getAttribute("userId"));
		libraryModel.setAdminFlag((String) session.getAttribute("adminFlag"));

		
		System.out.println("welcome");
		libraryModel.setAuthorName(authorName);
		libraryModel.setBookName(bookName);  
		libraryModel.setBookPrice(bookPrice);
		libraryModel.setPublisherName(publisherName);
		libraryModel.setCategory(category);
		libraryservice.addBookList(libraryModel);
		httpServletResponse.getOutputStream().print("success");
		
		
	}
	
	@RequestMapping(value="/addUserList",method=RequestMethod.POST)
	public void addUserList(@ModelAttribute LibraryModel libraryModel,String userName,String password ,String adminFlag,String emailId,HttpServletRequest httpServletRequest , HttpServletResponse httpServletResponse) throws IOException
	{
		HttpSession session= httpServletRequest.getSession() ;
		libraryModel.setUserName((String) session.getAttribute("userId"));
		libraryModel.setAdminFlag((String) session.getAttribute("adminFlag"));
		List<Map<String, Object>> validateUser = new LinkedList<Map<String,Object>>();


		
		libraryModel.setUserName(userName);
		libraryModel.setPassword(password);
		libraryModel.setEmailId(emailId);
		libraryModel.setAdminFlag(adminFlag);
		validateUser=libraryservice.validateUser(libraryModel);
		if(validateUser==null || validateUser.size()==0)
		{
		libraryservice.addUserList(libraryModel);
		httpServletResponse.getOutputStream().print("success");

		}
		else
		{
			httpServletResponse.getOutputStream().print("failure");

		}
		
		
	}
	
	@RequestMapping(value="/searchAuthors",method=RequestMethod.POST)
	public void searchAuthors(@ModelAttribute LibraryModel libraryModel,String bookName,String bookPrice,String authorName,HttpServletRequest httpServletRequest , HttpServletResponse httpServletResponse) throws IOException
	{
		HttpSession session= httpServletRequest.getSession() ;
		libraryModel.setUserName((String) session.getAttribute("userId"));
		libraryModel.setAdminFlag((String) session.getAttribute("adminFlag"));

		
		List<Map<String, Object>> authorList = new LinkedList<Map<String,Object>>();
	
		libraryModel.setAuthorName(authorName);
		libraryModel.setBookName(bookName);
		libraryModel.setBookPrice(bookPrice);
		authorList=	libraryservice.searchAuthors(libraryModel);
		
		List<JSONObject> jsonObj = new ArrayList<JSONObject>();

		for(Map<String, Object> data : authorList) {
		    JSONObject obj = new JSONObject(data);
		    jsonObj.add(obj);
		}

		JSONArray test = new JSONArray(jsonObj);

		httpServletResponse.getOutputStream().print(test.toString());
		
		
	}
	
	
	@RequestMapping(value="/searchUsers",method=RequestMethod.POST)
	public void searchUsers(@ModelAttribute LibraryModel libraryModel,String bookName,String bookPrice,String authorName,HttpServletRequest httpServletRequest , HttpServletResponse httpServletResponse) throws IOException
	{
		HttpSession session= httpServletRequest.getSession() ;
		libraryModel.setUserName((String) session.getAttribute("userId"));
		libraryModel.setAdminFlag((String) session.getAttribute("adminFlag"));

		List<Map<String, Object>> userList = new LinkedList<Map<String,Object>>();
		System.out.println("welcome");
		libraryModel.setAuthorName(authorName);
		libraryModel.setBookName(bookName);
		libraryModel.setBookPrice(bookPrice);
		userList=	libraryservice.searchUsers(libraryModel);
		
		List<JSONObject> jsonObj = new ArrayList<JSONObject>();

		for(Map<String, Object> data : userList) {
		    JSONObject obj = new JSONObject(data);
		    jsonObj.add(obj);
		}

		JSONArray test = new JSONArray(jsonObj);

		httpServletResponse.getOutputStream().print(test.toString());
		
		
	}
	
	
	@RequestMapping(value="/showFullDetails",method=RequestMethod.POST)
	public void showFullDetails(@ModelAttribute LibraryModel libraryModel,String authorName,HttpServletRequest httpServletRequest , HttpServletResponse httpServletResponse) throws IOException
	{
		HttpSession session= httpServletRequest.getSession() ;
		libraryModel.setUserName((String) session.getAttribute("userId"));
		libraryModel.setAdminFlag((String) session.getAttribute("adminFlag"));
		

		List<Map<String, Object>> authorList = new LinkedList<Map<String,Object>>();
		System.out.println("welcome");
		libraryModel.setAuthorName(authorName);
		
		authorList=	libraryservice.showFullDetails(libraryModel);
		
		List<JSONObject> jsonObj = new ArrayList<JSONObject>();

		for(Map<String, Object> data : authorList) {
		    JSONObject obj = new JSONObject(data);
		    jsonObj.add(obj);
		}

		JSONArray test = new JSONArray(jsonObj);

		httpServletResponse.getOutputStream().print(test.toString());
		
	}
	
	
	@RequestMapping(value="/editBook",method=RequestMethod.POST)
	public ModelAndView updateBook(@ModelAttribute LibraryModel libraryModel,String bookName,String bookPrice,String authorName,String category,HttpServletRequest httpServletRequest , HttpServletResponse httpServletResponse)
	{
		HttpSession session= httpServletRequest.getSession() ;
		libraryModel.setUserName((String) session.getAttribute("userId"));
		libraryModel.setAdminFlag((String) session.getAttribute("adminFlag"));

		//ModelAndView mav= new ModelAndView();
		System.out.println("welcome");
		libraryModel.setAuthorName(authorName);
		libraryModel.setBookName(bookName);
		libraryModel.setBookPrice(bookPrice);
		libraryModel.setCategory(category);
		libraryservice.editBook(libraryModel);
		
		
		ModelAndView modelAndView =  new ModelAndView("redirect:/AddBooks.jsp");
		//mav.setViewName("AddBooks.jsp");
		return modelAndView;
	}
	

	@RequestMapping(value="/lendBook",method=RequestMethod.POST)
	public ModelAndView lendBook(@ModelAttribute LibraryModel libraryModel,String bookName,String bookId,HttpServletRequest httpServletRequest , HttpServletResponse httpServletResponse)
	{
		
		HttpSession session= httpServletRequest.getSession();
		libraryModel.setUserName((String) session.getAttribute("userId"));
		libraryModel.setAdminFlag((String) session.getAttribute("adminFlag"));

		//ModelAndView mav= new ModelAndView();
		System.out.println("welcome");
		//libraryModel.setAuthorName(authorName);
		libraryModel.setBookName(bookName);
		libraryModel.setBookId(bookId);
		libraryservice.lendBook(libraryModel);
	
		
		ModelAndView modelAndView =  new ModelAndView("redirect:/menu.jsp");
		modelAndView.addObject("userId",libraryModel.getUserName());
		//mav.setViewName("AddBooks.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="/deleteBook",method=RequestMethod.POST)
	public ModelAndView deleteBook(@ModelAttribute LibraryModel libraryModel,String bookName,String bookPrice,String authorName,HttpServletRequest httpServletRequest , HttpServletResponse httpServletResponse)
	{
		HttpSession session= httpServletRequest.getSession() ;
		libraryModel.setUserName((String) session.getAttribute("userId"));
		libraryModel.setAdminFlag((String) session.getAttribute("adminFlag"));

		//ModelAndView mav= new ModelAndView();
		System.out.println("welcome");
		libraryModel.setAuthorName(authorName);
		libraryModel.setBookName(bookName);
		libraryModel.setBookPrice(bookPrice);
		libraryservice.deleteBook(libraryModel);
		
		
		ModelAndView modelAndView =  new ModelAndView("redirect:/AddBooks.jsp");
		//mav.setViewName("AddBooks.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="/editUser",method=RequestMethod.POST)
	public ModelAndView updateUser(@ModelAttribute LibraryModel libraryModel,String userName,String emailId,HttpServletRequest httpServletRequest , HttpServletResponse httpServletResponse)
	{
		HttpSession session= httpServletRequest.getSession() ;
		libraryModel.setUserName((String) session.getAttribute("userId"));
		libraryModel.setAdminFlag((String) session.getAttribute("adminFlag"));

		//ModelAndView mav= new ModelAndView();
		System.out.println("welcome");
		libraryModel.setUserName(userName);
		//libraryModel.setPassword(password);
		libraryModel.setEmailId(emailId);
		
		libraryservice.editUser(libraryModel);
		
		
		ModelAndView modelAndView =  new ModelAndView("redirect:/AddBooks.jsp");
		//mav.setViewName("AddBooks.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="/deleteUser",method=RequestMethod.POST)
	public ModelAndView deleteUser(@ModelAttribute LibraryModel libraryModel,String userName,String password,String emailId,HttpServletRequest httpServletRequest , HttpServletResponse httpServletResponse)
	{
		HttpSession session= httpServletRequest.getSession() ;
		libraryModel.setUserName((String) session.getAttribute("userId"));
		libraryModel.setAdminFlag((String) session.getAttribute("adminFlag"));

		//ModelAndView mav= new ModelAndView();
		System.out.println("welcome");
		libraryModel.setUserName(userName);
		libraryModel.setPassword(password);
		libraryModel.setEmailId(emailId);
		libraryservice.deleteUser(libraryModel);
		
		
		ModelAndView modelAndView =  new ModelAndView("redirect:/AddBooks.jsp");
		//mav.setViewName("AddBooks.jsp");
		return modelAndView;
	}
	
	
	
}
