package com.capestart.library;
import java.util.*;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Paths;

public class TagProb {

	/*
	 *Refer the PDF for task details
	*/



	/*
	 * Should not use 
	 * javax.xml.* or 
	 * org.w3c.* or
	 * org.jsoup.* or
	 * any other such libraries
	 * You should find the logic from scratch
	*/


		
		public static void main(String[] args) throws IOException {

			String inputHTMLTags = new String(Files.readAllBytes(Paths.get("D:\\htmlFile.txt")));
			System.out.println(inputHTMLTags);

			Scanner sc = new Scanner(System.in);
			System.out.println("Enter 1 to enter the line number or 2 to enter the tag name:");
			int userInput1 = sc.nextInt();
			
			switch(userInput1) {
				case 1:
					System.out.println("Enter the line number:");
					int lineNumber = sc.nextInt();
					findchildUsingLineNumber(inputHTMLTags, lineNumber);
					break;
				case 2:
					System.out.println("Enter the tag name:");
					sc.nextLine();
					String tagName = sc.nextLine();
					findchildUsingTagName(inputHTMLTags, tagName);
					break;
				default:
						System.out.println("Invalid Option at Switch");
			}
		}

		public static void findchildUsingLineNumber(String inputHTMLTags, int lineNumber) {

			ArrayList<String> child = new ArrayList<String>();
			String[] lines = inputHTMLTags.split(System.getProperty("line.separator"));
			String parentTag=lines[lineNumber-1].substring(1,lines[lineNumber-1].length()-1);
			//lineNumber=lineNumber+1;
			y:for(int j=lineNumber;j<lines.length;j++)
			{
				String cTag=lines[j];
				String sbstr=lines[j].substring(1,lines[j].length()-2);
				if(lines[j].substring(2,lines[j].length()-1).equalsIgnoreCase(parentTag))
				{
					break y;
				}
				child.add(cTag);
				
				if(!cTag.contains("/"))
				{
					lineNumber=iterateTags(j,cTag,lines.length,lines)+1;
					continue y;
				}
	

			}
			
			System.out.println("Output: "+child);
			
		}
		
		public static int iterateTags(int lineNumber,String tagName,int length, String[] lines)
		{
			for(int k=lineNumber+1;k<length-1;k++)
			{
				if(lines[k].substring(1,lines[k].length()-1).equalsIgnoreCase(tagName))
				{
					return k;
				}
			}
			
			return 0;
			
		}

		public static void findchildUsingTagName(String inputHTMLTags, String tagName) {

			ArrayList<String> child = new ArrayList<String>();

			/*
			 * Write your logic here
			*/

			System.out.println("Output: "+child);
		}

}
