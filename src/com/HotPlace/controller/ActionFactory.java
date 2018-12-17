package com.HotPlace.controller;

import com.HotPlace.action.Action;
import com.HotPlace.action.CardBoardDeleteAction;
import com.HotPlace.action.CardBoardUpdateFormAction;
import com.HotPlace.action.CardBoardViewAction;

public class ActionFactory {
	private static ActionFactory instance = new ActionFactory();

	public ActionFactory() {}
	
	public static ActionFactory getInstance() {
		return instance;
	}
	
	public Action getAction(String command) {
		Action action = null;
		
		if(command.equals("board_view")) {
			action = new CardBoardViewAction();
		} else if(command.equals("board_update_form")) {
			action = new CardBoardUpdateFormAction();
		} else if(command.equals("board_delete")) {
			action = new CardBoardDeleteAction();
		}
		System.out.println("action : " + action);
		return action;
	}
}
