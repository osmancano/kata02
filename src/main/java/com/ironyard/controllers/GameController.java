package com.ironyard.controllers;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by osmanidris on 2/10/17.
 */
@Controller
public class GameController {

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index() {
        return "redirect:/home.jsp";
    }

    @RequestMapping(value = "/speeding", method = RequestMethod.POST)
    public String speedTest(Model myModal, @RequestParam Integer txtSpeed, @RequestParam(required = false) Boolean birthDate) {
        String msg = "";
        if(birthDate == null) {
            birthDate = false;
        }
        if(birthDate){
           if(txtSpeed <=65) {
               msg = "No ticket";
           }
           if(txtSpeed > 65 && txtSpeed <=85){
               msg = "$50 ticket";
           }
           if(txtSpeed > 85){
               msg = "$200 ticket";
           }
        }else{
            if(txtSpeed <=60){
                msg = "No ticket";
            }
            if(txtSpeed > 60 && txtSpeed <= 80){
                msg = "$50 ticket";
            }
            if(txtSpeed > 80){
                msg = "$200 ticket";
            }
        }
        myModal.addAttribute("msg",msg);
        return "forward:/result.jsp";
    }

    @RequestMapping(value = "/sumFun", method = RequestMethod.POST)
    public String sumFunTest(Model myModal, @RequestParam Integer fNum, @RequestParam Integer sNum) {
        String msg = "Result is "+sortasum(fNum,sNum);
        myModal.addAttribute("msg",msg);
        return "forward:/result.jsp";
    }
    private Integer sortasum(Integer a, Integer b){
        Integer result = a + b;
        if(result >= 10 && result <=20){
            result = 20;
        }
        return result;
    }

    @RequestMapping(value = "/blackjack", method = RequestMethod.POST)
    public String blackJackGame(Model myModal, @RequestParam String dealers, @RequestParam String players){
        String msg = "";
        String[] dealersCards =  dealers.split(",");
        String[] playersCards = players.split(",");
        Integer dealersSum = sumCards(dealersCards);
        Integer playersSum = sumCards(playersCards);
        if (playersSum == 21 && dealersSum != 21)
            msg = "Player BlackJack";
        else if (dealersSum == 21 && playersSum != 21)
            msg = "Dealer BlackJack";
        else
        {
            if (playersSum >= dealersSum)
                msg = "Player";
            else
                msg = "Dealer";

            if (dealersSum > 21 && playersSum < 21)
                msg = "Player";
            else if (playersSum > 21 && dealersSum < 21)
                msg = "Dealer";
        }

        myModal.addAttribute("msg",msg);
        return "forward:/result.jsp";
    }

    private Integer sumCards(String[] cards){
        Integer sum = 0;
        for(int i=0; i< cards.length;i++){
            sum += Integer.parseInt(cards[i]);
        }
        return sum;
    }
}
