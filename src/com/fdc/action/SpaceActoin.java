package com.fdc.action;


import com.fdc.pojo.Users;
import com.fdc.service.HouseNewsService;
import com.fdc.service.UsersService;

public class SpaceActoin{
	UsersService usersService;
	HouseNewsService houseNewsService;
	public HouseNewsService getHouseNewsService() {
		return houseNewsService;
	}
	public void setHouseNewsService(HouseNewsService houseNewsService) {
		this.houseNewsService = houseNewsService;
	}

	Users users;
	int houseNewsId;
	public int getHouseNewsId() {
		return houseNewsId;
	}
	public void setHouseNewsId(int houseNewsId) {
		this.houseNewsId = houseNewsId;
	}
	public UsersService getUsersService() {
		return usersService;
	}
	public void setUsersService(UsersService usersService) {
		this.usersService = usersService;
	}
	public Users getUsers() {
		return users;
	}
	public void setUsers(Users users) {
		this.users = users;
	}
	
	public String updateUserInfo() {
		
		System.out.println(users.getNickName());
		System.out.println(users.getRealName());
		System.out.println(users.getPassword());
		System.out.println(users.getAge());
		System.out.println(users.getIcNumber());
		System.out.println(users.getEmail());
		System.out.println(users.getTel());
		
		users.setType(true);
		users.setChecked(true);
		users.setId(1);
		
		usersService.UpdateUserInfo(users);
		return "success";
	}
	
	public String shelves() {
		houseNewsService.shelvesHouseById(houseNewsId);
		return "success";
	}
}
