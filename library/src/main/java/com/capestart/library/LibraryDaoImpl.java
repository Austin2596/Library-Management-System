package com.capestart.library;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.stereotype.Repository;

@Repository
public class LibraryDaoImpl implements LibraryDao{

	/*
	 * @Autowired JdbcTemplate jdbctemplate;
	 */
	
	
	DriverManagerDataSource dmd = new DriverManagerDataSource();
	
	
	public int addBookList(LibraryModel librarymodel) {
		// TODO Auto-generated method stub
		try
		{
			
			
			
			  JdbcTemplate jdbc = getConnection();
			//LocalDate d=java.time.LocalDate.now();
			String sql="insert into BookDetails(AuthorName,author_id,Bookname,BookPrice,Created_Date,Publisher_Name,category)values(?,?,?,?,?,?,?)";
			int bookPrice=Integer.parseInt(librarymodel.getBookPrice());
			int result=jdbc.update(sql,librarymodel.getAuthorName(),Math.random()*1000,librarymodel.getBookName(),bookPrice,java.time.LocalDate.now(),librarymodel.getPublisherName(),librarymodel.getCategory());
			
			return result;
			
		
		
		}
		catch(Exception e)
		{
		return 0;	
		}
		
	}

	public List<Map<String, Object>> searchAuthors(LibraryModel librarymodel) {
		// TODO Auto-generated method stub
		try {
		List<Map<String, Object>> authorList = new LinkedList<Map<String,Object>>();
		
		/*
		 * DriverManagerDataSource dmd = new DriverManagerDataSource();
		 * dmd.setDriverClassName("com.mysql.jdbc.Driver");
		 * dmd.setUrl("jdbc:mysql://localhost:3306/Kindle"); dmd.setUsername("austin");
		 * dmd.setPassword("austin");
		 * 
		 * System.out.println("00000"+librarymodel.getAdminFlag());
		 */
		
		JdbcTemplate jdbc = getConnection();
		String sql="select AuthorName ,count(BookName) as BookCount from BookDetails where userAcces is  null group by AuthorName ";

		if(librarymodel.getAdminFlag()!=null && librarymodel.getAdminFlag().equalsIgnoreCase("A"))
		{
			 sql="select AuthorName ,count(BookName) as BookCount  from BookDetails group by AuthorName";

		}
		System.out.println(sql);
		authorList=jdbc.queryForList(sql);
		
		
		return authorList;
		}
		catch(Exception e)
		{
			
		}
		finally {
			try {
				dmd.getConnection().close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}

	public List<Map<String, Object>> showFullDetails(LibraryModel librarymodel) {
List<Map<String, Object>> authorList = new LinkedList<Map<String,Object>>();
		



JdbcTemplate jdbc = getConnection();
		String sql="select Book_id,AuthorName,BookName ,Publisher_Name,category,BookPrice ,Created_Date from BookDetails where AuthorName="+"'"+librarymodel.getAuthorName()+"' and userAcces is null";

		if(librarymodel.getAdminFlag()!=null && librarymodel.getAdminFlag().equalsIgnoreCase("A"))
		{
			 sql="select Book_id,AuthorName,BookName ,Publisher_Name,category,BookPrice ,lended_Date,Created_Date,userAcces from BookDetails where AuthorName="+"'"+librarymodel.getAuthorName()+"'";

			
		}
		authorList=jdbc.queryForList(sql);
		
		
		return authorList;
	}

	public int editBook(LibraryModel librarymodel) {
		// TODO Auto-generated method stub
try
{
	
	JdbcTemplate jdbc = getConnection();
		
		String sql="update BookDetails set BookPrice="+"'"+librarymodel.getBookPrice()+"' , category="+"'"+librarymodel.getCategory()+"' where BookName="+"'"+librarymodel.getBookName()+"'";
		//int bookPrice=Integer.parseInt(librarymodel.getBookPrice());
		int result=jdbc.update(sql);
		
		return result;
		
	
	}
	catch(Exception e)
	{
	return 0;	
	}
	
}

	public int deleteBook(LibraryModel librarymodel) {
		// TODO Auto-generated method stub
		try
		{
			
			
			JdbcTemplate jdbc = getConnection();
			String sql="delete from  BookDetails where BookName="+"'"+librarymodel.getBookName()+"'";
		//	int bookPrice=Integer.parseInt(librarymodel.getBookPrice());
			int result=jdbc.update(sql);
			
			return result;
			
			
		
		}
		catch(Exception e)
		{
		return 0;	
		}
	}

	public List<Map<String, Object>> validateUser(LibraryModel libraryModel) {
		// TODO Auto-generated method stub
		try
		{
List<Map<String, Object>> authorList = new LinkedList<Map<String,Object>>();
		

JdbcTemplate jdbc = getConnection();
		String sql="select userName,userPassword,adminFlag from UserDetails where userName="+"'"+libraryModel.getUserName()+"' and userPassword="+"'"+libraryModel.getPassword()+"'";
		
		authorList=jdbc.queryForList(sql);
		
		
		return authorList;
		}
		catch(Exception e)
		{
			
		}
		finally {
			try {
				dmd.getConnection().close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
		
	}

	public int addUserList(LibraryModel libraryModel) {
		try
		{
			
			
			
			
			JdbcTemplate jdbc = getConnection();
			//LocalDate d=java.time.LocalDate.now();
			String sql="insert into UserDetails(userName,userPassword,EmailId,adminFlag)values(?,?,?,?)";
			//int bookPrice=Integer.parseInt(libraryModel.getBookPrice());
			//String bookId=Math.random()+libraryModel.getUserName();
			int result=jdbc.update(sql,libraryModel.getUserName(),libraryModel.getPassword(),libraryModel.getEmailId(),libraryModel.getAdminFlag());
			
			return result;
			
			
		
		}
		catch(Exception e)
		{
		return 0;	
		}
		finally {
			try {
				dmd.getConnection().close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
}

	public List<Map<String, Object>> searchUsers(LibraryModel libraryModel) {
		try
		{
List<Map<String, Object>> userList = new LinkedList<Map<String,Object>>();
		


JdbcTemplate jdbc = getConnection();
		String sql="select userName ,noOfBooksTaken,EmailId  from UserDetails";
		
		userList=jdbc.queryForList(sql);
		
		
		return userList;
		}
		catch(Exception e)
		{
			
		}
		finally {
			try {
				dmd.getConnection().close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}

	public int editUser(LibraryModel libraryModel) {
		// TODO Auto-generated method stub
		try
		{
			
			
			JdbcTemplate jdbc = getConnection();
				String sql="update UserDetails set EmailId="+"'"+libraryModel.getEmailId()+"' where userName="+"'"+libraryModel.getUserName()+"'";
				//int bookPrice=Integer.parseInt(librarymodel.getBookPrice());
				int result=jdbc.update(sql);
				
				return result;
				
				
			
			}
			catch(Exception e)
			{
			return 0;	
			}
			
	}

	public int deleteUser(LibraryModel libraryModel) {
		// TODO Auto-generated method stub
		try
		{
			
			
			
			JdbcTemplate jdbc = getConnection();
			
			String sql="delete from  UserDetails where userName="+"'"+libraryModel.getUserName()+"'";
		//	int bookPrice=Integer.parseInt(librarymodel.getBookPrice());
			int result=jdbc.update(sql);
			
			return result;
			
			
		
		}
		catch(Exception e)
		{
		return 0;	
		}
	}

	public int lendBook(LibraryModel libraryModel) {
		// TODO Auto-generated method stub
		try
		{
			List<Map<String, Object>> countList = new LinkedList<Map<String,Object>>();

			
			JdbcTemplate jdbc = getConnection();
			
				String sql="update BookDetails set userAcces="+"'"+libraryModel.getUserName()+"' , lended_Date="+"'"+java.time.LocalDate.now()+"' where Book_id="+"'"+libraryModel.getBookId()+"'";
				//int bookPrice=Integer.parseInt(librarymodel.getBookPrice());
				int result=jdbc.update(sql);
				
				return result;
				
				
			
			}
			catch(Exception e)
			{
			return 0;	
			}
			
	}
	
	
	
	
	public JdbcTemplate getConnection()
	{

		DriverManagerDataSource dmd = new DriverManagerDataSource();
		dmd.setDriverClassName("com.mysql.jdbc.Driver");
		dmd.setUrl("jdbc:mysql://localhost:3306/Kindle");
		dmd.setUsername("austin");
		dmd.setPassword("austin");
		return new JdbcTemplate(dmd);
	}
	

}
