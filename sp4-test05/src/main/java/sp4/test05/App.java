package sp4.test05;

import java.util.Scanner;

import org.springframework.context.support.GenericXmlApplicationContext;

import Main.DTO.RegisterRequest;
import Main.service.ChangePasswordService;
import Main.service.MemberInfoPrinter;
import Main.service.MemberListPrinter;
import Main.service.MemberRegisterService;

public class App {
	private static GenericXmlApplicationContext ctx;
	public static void main(String[] args) {
		ctx = new GenericXmlApplicationContext("classpath:appCtx.xml");//classpath == src/main/resources
		Scanner sc = new Scanner(System.in);
		while(true) {
			
			System.out.println("명령어를 입력하세요");
			String command = sc.nextLine();
			if(command.startsWith("new ")) {
				String[] arg = command.split(" ");
				if(arg.length != 5) {
					printHelp();//static없을 시 객체 생성 필요
					System.out.println("============================");
					continue;
				}
				RegisterRequest req = new RegisterRequest();
				req.setEmail(arg[1]);
				req.setName(arg[2]);
				req.setPassword(arg[3]);
				req.setConfirmPassword(arg[4]);
				boolean b1 = req.isPasswordEqualConfirmPassword();
				if(!b1) {
					System.out.println("비밀번호가 일치하지 않습니다.");
					continue;
				}
				MemberRegisterService mrs = ctx.getBean("memberRegisterService", MemberRegisterService.class);
				mrs.regist(req);
			}
			else if(command.startsWith("change ")){
				String[] arg = command.split(" ");
				if(arg.length != 4) {
					printHelp();//static없을 시 객체 생성 필요
					System.out.println("============================");
					continue;
				}else {
					ChangePasswordService changePwdSvc = ctx.getBean("changePasswordService", ChangePasswordService.class);
					changePwdSvc.changePw(arg[1], arg[2], arg[3]);
				}
				
			}
			else if(command.equals("list")) {
				MemberListPrinter listPrint = ctx.getBean("memberListPrinter", MemberListPrinter.class);
				listPrint.printAll();
			}
			else if(command.startsWith("info ")){
				String[] arg = command.split(" ");
				if(arg.length != 2) {
					printHelp();//static없을 시 객체 생성 필요
					System.out.println("============================");
					continue;
				}else {
					MemberInfoPrinter infoPrinter = ctx.getBean("memberInfoPrinter", MemberInfoPrinter.class);
					infoPrinter.printMemberInfo(arg[1]);
				}
			}
			else if(command.equals("exit")) {
				System.out.println("프로그램을 종료합니다.");
				System.exit(0);
			}else {
				printHelp();
			}
		}
		
	}
	public static void printHelp() {
		System.out.println();
		System.out.println("명령어 사용법:");
		System.out.println("new 이메일 이름 암호 암호확인");
		System.out.println("change 이메일 현재비번 변경비번");
		System.out.println("list");
		System.out.println("info 이메일");
		System.out.println("프로그램 종료는 exit");
	}

}
