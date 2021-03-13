package com.capestart.library;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LibraryServiceImpl implements LibraryService{
	@Autowired
	LibraryDao librarydao;

	public int addBookList(LibraryModel librarymodel) {
		// TODO Auto-generated method stub
		return librarydao.addBookList(librarymodel);
	}

	public List<Map<String, Object>> searchAuthors(LibraryModel librarymodel) {
		// TODO Auto-generated method stub
		return librarydao.searchAuthors(librarymodel);
	}

	public List<Map<String, Object>> showFullDetails(LibraryModel librarymodel) {
		// TODO Auto-generated method stub
		return librarydao.showFullDetails(librarymodel);
	}

	public int editBook(LibraryModel librarymodel) {
		// TODO Auto-generated method stub
		return librarydao.editBook(librarymodel);
	}

	public int deleteBook(LibraryModel librarymodel) {
		// TODO Auto-generated method stub
		return librarydao.deleteBook(librarymodel);
	}

	public List<Map<String, Object>> validateUser(LibraryModel libraryModel) {
		// TODO Auto-generated method stub
		return librarydao.validateUser(libraryModel);	}

	public int addUserList(LibraryModel libraryModel) {
		// TODO Auto-generated method stub
		return librarydao.addUserList(libraryModel);
	}

	public List<Map<String, Object>> searchUsers(LibraryModel libraryModel) {
		// TODO Auto-generated method stub
		return librarydao.searchUsers(libraryModel);
	}

	public int editUser(LibraryModel libraryModel) {
		// TODO Auto-generated method stub
		return librarydao.editUser(libraryModel);
	}

	public int deleteUser(LibraryModel libraryModel) {
		// TODO Auto-generated method stub
		return librarydao.deleteUser(libraryModel);
	}

	public int lendBook(LibraryModel libraryModel) {
		// TODO Auto-generated method stub
		return librarydao.lendBook(libraryModel);
	}

}
