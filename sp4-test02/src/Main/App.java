package Main;

import java.util.Scanner;

import Main.DTO.RegisterRequest;

public class App {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("명령어를 입력하세요");
		String command = sc.nextLine();
		if(command.startsWith("new")) {
			//의존객체: 클래스 안에 있는 클래스(객체)
			RegisterRequest req = new RegisterRequest();
		}
		
	}
	public static void printHelp() {
		System.out.println();
		System.out.println("명령어 사용법:");
		System.out.println("new 이메일 이름 암호 암호확인");
		System.out.println("change 이메일 현재비번 변경비번");
		System.out.println("list");
		System.out.println("info 이메일");
	}

}
