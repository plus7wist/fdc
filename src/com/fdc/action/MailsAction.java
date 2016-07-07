package com.fdc.action;

import java.sql.Timestamp;

import com.fdc.pojo.Mails;
import com.fdc.service.MailsService;

public class MailsAction {
	private Mails mail;
	private MailsService mailsService;
	int toId;
	String msg;

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public int getToId() {
		return toId;
	}

	public void setToId(int toId) {
		this.toId = toId;
	}

	public Mails getMail() {
		return mail;
	}

	public void setMail(Mails mail) {
		this.mail = mail;
	}

	public MailsService getMailsService() {
		return mailsService;
	}

	public void setMailsService(MailsService mailsService) {
		this.mailsService = mailsService;
	}

	public String sendMessage() {
		java.util.Date date = new java.util.Date();
		Timestamp addtime = new Timestamp(date.getTime());
		if (mail == null) {
			msg = "mail null pointer error";
			return "error";
		}
		mail.setSendTime(addtime);
		mail.setUserFromId(1);
		if (mailsService.sendMail(mail))
			return "success";
		else {
			msg = "�ʼ�����ʧ��";
			return "error";
		}
	}

	public String toMails() {
		return "success";
	}
}
