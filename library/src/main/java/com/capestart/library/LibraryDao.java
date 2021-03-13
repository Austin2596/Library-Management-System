package com.capestart.library;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public interface LibraryDao {
	
	public int addBookList(LibraryModel librarymodel);
	public List<Map<String,Object>> searchAuthors(LibraryModel librarymodel);
	public List<Map<String,Object>> showFullDetails(LibraryModel librarymodel);
	
	public int editBook(LibraryModel librarymodel);
	public int deleteBook(LibraryModel librarymodel);
	public List<Map<String, Object>> validateUser(LibraryModel libraryModel);
	public int addUserList(LibraryModel libraryModel);
	public List<Map<String, Object>> searchUsers(LibraryModel libraryModel);
	public int editUser(LibraryModel libraryModel);
	public int deleteUser(LibraryModel libraryModel);
	public int lendBook(LibraryModel libraryModel);



}
