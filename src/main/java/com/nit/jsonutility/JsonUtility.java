package com.nit.jsonutility;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;

import com.nit.javabean.UserDataBean;

public class JsonUtility {
	private static ObjectMapper objMapper;
	static {
		objMapper = new ObjectMapper();
	}
	public static String convertJavaToJson(ArrayList<UserDataBean> obj){
		System.out.println("JsonUtility.convertJavaToJson()");
		String jsonRes = "";
		
		try {
			// writing all users from db to a String 
			jsonRes = objMapper.writeValueAsString(obj);
			
			// Writing ArrayList into .json file
			// Note : everyone change the .json file path as per your system & while testing it call me.
<<<<<<< HEAD
			objMapper.writeValue(new File("C:\\Users\\HP\\git\\SkillExchangeProject\\AllUsersData.json"), obj);
=======
			objMapper.writeValue(new File("C:\\Users\\91762\\git\\SkillExchangeProject\\AllUsersData.json"), obj);
>>>>>>> ce500aac4b86de14abc6530c5acdcc8ddb0e9b70
			System.out.println("Users data written into .json file");
		
		} catch(JsonGenerationException e) {
			System.out.println("Exception occured while converting java obj into json : "+e.getMessage());
			e.printStackTrace();
		} catch(JsonMappingException e) {
			System.out.println("Exception occured while converting java obj into json : "+e.getMessage());
			e.printStackTrace();
		} catch(IOException e) {
			System.out.println("Exception occured while converting java obj into json : "+e.getMessage());
			e.printStackTrace();
		}
		
		return jsonRes;
	}
	
	public static <T>T convertJsonToJava(String jsonStr, Class<T> cls) {
		T res = null;
		try {
			res = objMapper.readValue(jsonStr, cls);
		} catch(JsonParseException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		}		
		catch (IOException e) {
			e.printStackTrace();
		}
		
		return res;
	}
}
