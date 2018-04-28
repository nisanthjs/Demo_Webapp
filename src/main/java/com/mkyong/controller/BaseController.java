package com.mkyong.controller;

import java.util.List;

import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BaseController {

	private static int counter = 0;
	private static final String VIEW_INDEX = "index";
	private final static org.slf4j.Logger logger = LoggerFactory.getLogger(BaseController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String welcome(ModelMap model) {

		model.addAttribute("message", " DevOps on Cloud ");
		model.addAttribute("counter", ++counter);
		MySQLAccess mySQLAccess = new MySQLAccess();
		List<String> countryList = mySQLAccess.readDataBase("select name from world.country");
		model.addAttribute("countryList", countryList);
		List<String> languageList = mySQLAccess.readDataBase("select Language from countrylanguage where CountryCode = 'IND'");
		model.addAttribute("languageList", languageList);
		List<String> cityList = mySQLAccess.readDataBase("select name from city where CountryCode = 'IND'");
		model.addAttribute("cityList", cityList);
		logger.debug("[welcome] counter : {}", counter);

		// Spring uses InternalResourceViewResolver and return back index.jsp
		return VIEW_INDEX;

	}

	@RequestMapping(value = "/{name}", method = RequestMethod.GET)
	public String welcomeName(@PathVariable String name, ModelMap model) {

		model.addAttribute("message", "Welcome " + name);
		model.addAttribute("counter", ++counter);
		logger.debug("[welcomeName] counter : {}", counter);
		return VIEW_INDEX;

	}

}
