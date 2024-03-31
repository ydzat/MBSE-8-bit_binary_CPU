package processor.m500_memory;

// Units
import processor.m600_processor.Computer;

// Test JUNIT 5
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;
import org.junit.jupiter.api.Test;
// Log 
import montiarc.rte.log.Log;
import de.se_rwth.commons.logging.LogStub;
// Java 
import java.util.stream.Stream;
import java.util.ArrayList;
import java.util.HashMap;


public class IOTest {

    final int RAM_SIZE = 8;

    boolean [][] instructions = {
        // A
        {false, true, false, false, false, false, 
            true, false, false, true, false, 
            false, false, false, false, false, false},
        // D
        {false, true, false, false, false, false, 
            true, false, false, true, true, 
            false, false, false, false, false, false},
        // D & A
        {false, true, false, false, false, false, 
            false, false, false, false, true, 
            false, false, false, false, false, false},
        // D | A
        {false, true, false, false, false, false, 
            false, false, true, false, false, 
            false, false, false, false, false, false},
        // D ^ A
        {false, true, false, false, false, false, 
            false, true, false, false, false, 
            false, false, false, false, false, false},
        // ~D
        {false, true, false, false, false, false, 
            false, true, true, false, false, 
            false, false, false, false, false, false},
        // ~A
        {false, true, false, false, false, false, 
            false, true, true, false, true, 
            false, false, false, false, false, false},
        // -1
        {false, true, false, false, false, false, 
            false, true, true, true, false, 
            false, false, false, false, false, false},
        // D + A
        {false, true, false, false, false, false, 
            true, false, false, false, false, 
            false, false, false, false, false, false},
        // D + 1
        {false, true, false, false, false, false, 
            true, false, true, false, false, 
            false, false, false, false, false, false},
        // A + 1
        {false, true, false, false, false, false, 
            true, false, true, false, true, 
            false, false, false, false, false, false},
        // 1
        {false, true, false, false, false, false, 
            true, false, true, true, false, 
            false, false, false, false, false, false},
        // D - A
        {false, true, false, false, false, false, 
            true, true, false, false, false, 
            false, false, false, false, false, false},
        // A - D
        {false, true, false, false, false, false, 
            true, true, false, false, true, 
            false, false, false, false, false, false},
        // - A
        {false, true, false, false, false, false, 
            true, true, false, true, false, 
            false, false, false, false, false, false},
        // - D
        {false, true, false, false, false, false, 
            true, true, false, true, true, 
            false, false, false, false, false, false},
        // D - 1
        {false, true, false, false, false, false, 
            true, true, true, false, false, 
            false, false, false, false, false, false},
        // A - 1
        {false, true, false, false, false, false, 
            true, true, true, false, true, 
            false, false, false, false, false, false},
        // --------------------------------------------
        
        // *A
        {false, true, false, false, true, false, 
            true, false, false, true, false, 
            false, false, false, false, false, false},
        // D & *A
        {false, true, false, false, true, false, 
            false, false, false, false, true, 
            false, false, false, false, false, false},
        // D | *A
        {false, true, false, false, true, false, 
            false, false, true, false, false, 
            false, false, false, false, false, false},
        // D ^ *A
        {false, true, false, false, true, false, 
            false, true, false, false, false, 
            false, false, false, false, false, false},

        // ~*A
        {false, true, false, false, true, false, 
            false, true, true, false, true, 
            false, false, false, false, false, false},
        // D + *A
        {false, true, false, false, true, false, 
            true, false, false, false, false, 
            false, false, false, false, false, false},
        // *A + 1
        {false, true, false, false, true, false, 
            true, false, true, false, true, 
            false, false, false, false, false, false},
        // D - *A
        {false, true, false, false, true, false, 
            true, true, false, false, false, 
            false, false, false, false, false, false},
        // *A - D
        {false, true, false, false, true, false, 
            true, true, false, false, true, 
            false, false, false, false, false, false},
        // - *A
        {false, true, false, false, true, false, 
            true, true, false, true, false, 
            false, false, false, false, false, false},
        // *A - 1
        {false, true, false, false, true, false, 
            true, true, true, false, true, 
            false, false, false, false, false, false},
        // 0
        {false, true, false, false, false, false, 
            false, false, false, true, false, 
            false, false, false, false, false, false},
        // D < A
        {false, true, false, false, false, false, 
            false, false, false, false, false, 
            false, false, false, true, false, false},
        // D <= A
        {false, true, false, false, false, false, 
            false, false, false, false, false, 
            false, false, false, true, true, false},
        // D > A
        {false, true, false, false, false, false, 
            false, false, false, false, false, 
            false, false, false, false, false, true},
        // D >= A
        {false, true, false, false, false, false, 
            false, false, false, false, false, 
            false, false, false, false, true, true},
        // D == A
        {false, true, false, false, false, false, 
            false, false, false, false, false, 
            false, false, false, false, true, false},
        // D <> A, which means not equal
        {false, true, false, false, false, false, 
            false, false, false, false, false, 
            false, false, false, true, false, true},
        // JMP
        {false, true, false, false, false, false, 
            false, false, false, false, false, 
            false, false, false, true, true, true}
        

    };


    HashMap<String, boolean[]> instructionMap = new HashMap<String, boolean[]>();
    

    @BeforeEach
    void setUp(){
        // initialize the Log such that the MontiArc output can be seen
        // LogStub.initPlusLog();
        // Log.setTraceEnabled(true);
        // LogStub.enableFailQuick(false);
        instructionMap.put("A", instructions[0]);
        instructionMap.put("D", instructions[1]);
        instructionMap.put("D&A", instructions[2]);
        instructionMap.put("D|A", instructions[3]);
        instructionMap.put("D^A", instructions[4]);
        instructionMap.put("~D", instructions[5]);
        instructionMap.put("~A", instructions[6]);
        instructionMap.put("-1", instructions[7]);
        instructionMap.put("D+A", instructions[8]);
        instructionMap.put("D+1", instructions[9]);
        instructionMap.put("A+1", instructions[10]);
        instructionMap.put("1", instructions[11]);
        instructionMap.put("D-A", instructions[12]);
        instructionMap.put("A-D", instructions[13]);
        instructionMap.put("-A", instructions[14]);
        instructionMap.put("-D", instructions[15]);
        instructionMap.put("D-1", instructions[16]);
        instructionMap.put("A-1", instructions[17]);
        instructionMap.put("*A", instructions[18]);
        instructionMap.put("D&*A", instructions[19]);
        instructionMap.put("D|*A", instructions[20]);
        instructionMap.put("D^*A", instructions[21]);
        instructionMap.put("~*A", instructions[22]);
        instructionMap.put("D+*A", instructions[23]);
        instructionMap.put("*A+1", instructions[24]);
        instructionMap.put("D-*A", instructions[25]);
        instructionMap.put("*A-D", instructions[26]);
        instructionMap.put("-*A", instructions[27]);
        instructionMap.put("*A-1", instructions[28]);
        instructionMap.put("0", instructions[29]);
        instructionMap.put("D<A", instructions[30]);
        instructionMap.put("D<=A", instructions[31]);
        instructionMap.put("D>A", instructions[32]);
        instructionMap.put("D>=A", instructions[33]);
        instructionMap.put("D==A", instructions[34]);
        instructionMap.put("D<>A", instructions[35]);
        instructionMap.put("JMP", instructions[36]);

        this.result = new boolean[8];
        this.resultInt = 0;
        this.lastLocation = 0;
    }


    @Test
    public void tester(){
        testCalculation();
        System.out.println("Result = " + this.result[0] + " " + this.result[1] + " " + this.result[2] + " " + this.result[3] + " " + this.result[4] + " " + this.result[5] + " " + this.result[6] + " " + this.result[7]);

        System.out.println("LastLocation = " + this.lastLocation);
        for (int i = 0; i < result.length; i++) {
            if (this.result[i]) {
                this.resultInt += Math.pow(2, result.length - 1 - i);
            }
        }

        if (this.result[0] == true) {
            this.resultInt = -1 * (256 - this.resultInt);
        }

        System.out.println("ResultInt = " + this.resultInt);
    }

    public boolean [] num2Stream(String num){
        boolean [] result = new boolean[17];
        result[0] = false;
        
        int decimal = Integer.parseInt(num);
        String binaryString = Integer.toBinaryString(decimal);
        while (binaryString.length() < 8) {
            binaryString = "0" + binaryString;
        }

        for(int i = 0; i < binaryString.length(); i++){
            if(binaryString.charAt(i) == '1'){
                result[i+9] = true;
            }else{
                result[i+9] = false;
            }
        }
        return result;
    }

    public ArrayList<String> input2Slice(String input){
        ArrayList<String> list = new ArrayList<String>();
        
        int op = input.indexOf('+') != -1 ? input.indexOf('+') : 
                 input.indexOf('-') != -1 ? input.indexOf('-') : 
                 input.indexOf('&') != -1 ? input.indexOf('&') : 
                 input.indexOf('|') != -1 ? input.indexOf('|') : 
                 input.indexOf('^') != -1 ? input.indexOf('^') : 
                 input.indexOf('~') != -1 ? input.indexOf('~') : 
                 input.indexOf('x') != -1 ? input.indexOf('x') : 
                 input.indexOf('o') != -1 ? input.indexOf('o') : 
                 0;
        if(op == 0){
            list.add(input.substring(0,1));
            list.add(input.substring(1,input.length()));
        }
        else{
            list.add(input.substring(0,op));
            list.add(input.substring(op,op+1));
            list.add(input.substring(op+1,input.length()));
        }

        return list;
    }

    public void transfer2Computer(boolean [] stream, Computer computer, int location, boolean targetA, boolean targetD, boolean targetSA){

        computer.getCl().update(stream[0]);
        computer.getI15().update(stream[1]);
        computer.getI14().update(stream[2]);
        computer.getI13().update(stream[3]);
        computer.getI12().update(stream[4]);
        computer.getI11().update(stream[5]);
        computer.getI10().update(stream[6]);
        computer.getI9().update(stream[7]);
        computer.getI8().update(stream[8]);
        computer.getI7().update(stream[9]);
        computer.getI6().update(stream[10]);

        if (stream[1] == true){
            computer.getI5().update(targetA);
            computer.getI4().update(targetD);
            computer.getI3().update(targetSA);
        }
        else{
            computer.getI5().update(stream[11]);
            computer.getI4().update(stream[12]);
            computer.getI3().update(stream[13]);
        }

        computer.getI2().update(stream[14]);
        computer.getI1().update(stream[15]);
        computer.getI0().update(stream[16]);

        computer.compute();
        computer.tick();

        computer.getCl().update(true);
        computer.getI15().update(stream[1]);
        computer.getI14().update(stream[2]);
        computer.getI13().update(stream[3]);
        computer.getI12().update(stream[4]);
        computer.getI11().update(stream[5]);
        computer.getI10().update(stream[6]);
        computer.getI9().update(stream[7]);
        computer.getI8().update(stream[8]);
        computer.getI7().update(stream[9]);
        computer.getI6().update(stream[10]);

        if (stream[1] == true){
            computer.getI5().update(targetA);
            computer.getI4().update(targetD);
            computer.getI3().update(targetSA);
        }
        else{
            computer.getI5().update(stream[11]);
            computer.getI4().update(stream[12]);
            computer.getI3().update(stream[13]);
        }

        computer.getI2().update(stream[14]);
        computer.getI1().update(stream[15]);
        computer.getI0().update(stream[16]);

        computer.compute();

        //readRAM(computer, location);
        readLastRAM(computer, location);

        computer.tick();
    }

    public void readRAM(Computer computer, int location){

        // location -> a b c
        boolean a = (location & 4) == 4;
        boolean b = (location & 2) == 2;
        boolean c = (location & 1) == 1;

        System.out.println("RAM: " + location + ": " + computer.getComponentMem().getSa7().getValue() + " " + computer.getComponentMem().getSa6().getValue() + " " + computer.getComponentMem().getSa5().getValue() + " " + computer.getComponentMem().getSa4().getValue() + " " + computer.getComponentMem().getSa3().getValue() + " " + computer.getComponentMem().getSa2().getValue() + " " + computer.getComponentMem().getSa1().getValue() + " " + computer.getComponentMem().getSa0().getValue());        
    }

    boolean [] result;
    int resultInt;
    int lastLocation;

    public void readLastRAM(Computer computer, int location){
        boolean a = (location & 4) == 4;
        boolean b = (location & 2) == 2;
        boolean c = (location & 1) == 1;
        this.lastLocation = location;
        this.result[0] = computer.getComponentMem().getSa7().getValue();
        this.result[1] = computer.getComponentMem().getSa6().getValue();
        this.result[2] = computer.getComponentMem().getSa5().getValue();
        this.result[3] = computer.getComponentMem().getSa4().getValue();
        this.result[4] = computer.getComponentMem().getSa3().getValue();
        this.result[5] = computer.getComponentMem().getSa2().getValue();
        this.result[6] = computer.getComponentMem().getSa1().getValue();
        this.result[7] = computer.getComponentMem().getSa0().getValue();

    }



    public boolean [] setLocation(int location){
        boolean [] result = new boolean[17];
        String binaryString = Integer.toBinaryString(location);
        while (binaryString.length() < 17) {
            binaryString = "0" + binaryString;
        }
        for(int i = 0; i < 17; i++){
            if(binaryString.charAt(i) == '1'){
                result[i] = true;
            }else{
                result[i] = false;
            }
        }
        return result;
    }


    public void testCalculation(){
        Computer computer = new Computer();
        computer.setUp();
        computer.init();

        /*
         * +: Addition
         * -: Subtraction or Negation
         * &: Per Bitwise AND
         * |: Per Bitwise OR
         * ^: Per Bitwise XOR
         * ~: Per Bitwise NOT
         */
        String[] input = {
            "15+3",
            // "5+1",

            "3-15",
            // "5-1",

            // "1&1",
            
            // "0&0",
            
            // "5&4",
            // "5&0",
            "3&1",

            // "4&1",

            // "1|1",
            // "0|0",
            
            "4|3",
            
            // "2^3",
            // "2^0",
            "7^5",

            // "~1",
            // "~2",
            // "~3",
            "~4",
            // "~5",
            // "~6",
            // "~7",
            // "~8",
            // "~9",

            // "-2",
            // "-3",
            // "-1",
            "-50",

            "1&0",
            "1|0",
            "15-3"
        };
        int location = 0;

        for(String i : input){
            ArrayList<String> list = new ArrayList<String>(input2Slice(i));

            if (list.size() == 2){
                if (list.get(0).equals("~")){
                    boolean [] nums = num2Stream(list.get(1));

                    // according to the value of location to decide the value of A
                    boolean [] locationStream = setLocation(location);

                    // A = num
                    transfer2Computer(nums, computer, location, false, false, false);
                    //D = ~A
                    //transfer2Computer(ops, computer, location, false, true, false);
                    transfer2Computer(instructionMap.get("~A"), computer, location, false, true, false);
                    // A = location
                    transfer2Computer(locationStream, computer, location, false, false, false);
                    // A * = D
                    transfer2Computer(instructionMap.get("D"), computer, location, false, false, true);
                    //check if store is correct
                    //readRAM(computer,location);
                    location = (location + 1) % RAM_SIZE;
                }
                else if(list.get(0).equals("-")){
                    boolean [] nums = num2Stream(list.get(1));

                    // according to the value of location to decide the value of A
                    boolean [] locationStream = setLocation(location);

                    // A = num
                    transfer2Computer(nums, computer, location, false, false, false);
                    //D = -A
                    //transfer2Computer(ops, computer, location, false, true, false);
                    transfer2Computer(instructionMap.get("-A"), computer, location, false, true, false);
                    // A = location
                    transfer2Computer(locationStream, computer, location, false, false, false);
                    // A * = D
                    transfer2Computer(instructionMap.get("D"), computer, location, false, false, true);
                    //check if store is correct
                    //readRAM(computer,location);
                    location = (location + 1) % RAM_SIZE;
                }
                
            }
            else if (list.get(1).equals("+")){

                boolean [] num0 = num2Stream(list.get(0));
                boolean [] num1 = num2Stream(list.get(2));

                // according to the value of location to decide the value of A
                boolean [] locationStream = setLocation(location);
                // A = num0
                transfer2Computer(num0, computer, location, false, false, false);
                // D = 0
                transfer2Computer(instructionMap.get("0"), computer, location, false, true, false);
                // D = D + A
                transfer2Computer(instructionMap.get("D+A"), computer, location, false, true, false);
                // A = num1
                transfer2Computer(num1, computer, location, false, false, false);
                // D = D + A
                transfer2Computer(instructionMap.get("D+A"), computer, location, false, true, false);
                // A = location
                transfer2Computer(locationStream, computer, location, false, false, false);
                // A * = D
                transfer2Computer(instructionMap.get("D"), computer, location, false, false, true);
                location = (location + 1) % RAM_SIZE;
            }
            else if (list.get(1).equals("-")){
                boolean [] num0 = num2Stream(list.get(0));
                boolean [] num1 = num2Stream(list.get(2));

                // according to the value of location to decide the value of A
                boolean [] locationStream = setLocation(location);
                // A = num0
                transfer2Computer(num0, computer, location, false, false, false);
                // D = 0
                transfer2Computer(instructionMap.get("0"), computer, location, false, true, false);
                // D = D + A
                transfer2Computer(instructionMap.get("D+A"), computer, location, false, true, false);
                // A = num1
                transfer2Computer(num1, computer, location, false, false, false);
                // D = D - A
                transfer2Computer(instructionMap.get("D-A"), computer, location, false, true, false);
                // A = location
                transfer2Computer(locationStream, computer, location, false, false, false);
                // A * = D
                transfer2Computer(instructionMap.get("D"), computer, location, false, false, true);
                location = (location + 1) % RAM_SIZE;
            }
            else if (list.get(1).equals("&")){
                boolean [] num0 = num2Stream(list.get(0));
                boolean [] num1 = num2Stream(list.get(2));

                // according to the value of location to decide the value of A
                boolean [] locationStream = setLocation(location);
                // A = num0
                transfer2Computer(num0, computer, location, false, false, false);
                // D = 0
                transfer2Computer(instructionMap.get("0"), computer, location, false, true, false);
                // D = D + A
                transfer2Computer(instructionMap.get("D+A"), computer, location, false, true, false);
                // A = num1
                transfer2Computer(num1, computer, location, false, false, false);
                // D = D & A
                transfer2Computer(instructionMap.get("D&A"), computer, location, false, true, false);
                // A = location
                transfer2Computer(locationStream, computer, location, false, false, false);
                // A * = D
                transfer2Computer(instructionMap.get("D"), computer, location, false, false, true);
                location = (location + 1) % RAM_SIZE;
            }
            else if (list.get(1).equals("|")){
                boolean [] num0 = num2Stream(list.get(0));
                boolean [] num1 = num2Stream(list.get(2));

                // according to the value of location to decide the value of A
                boolean [] locationStream = setLocation(location);
                // A = num0
                transfer2Computer(num0, computer, location, false, false, false);
                // D = 0
                transfer2Computer(instructionMap.get("0"), computer, location, false, true, false);
                // D = D + A
                transfer2Computer(instructionMap.get("D+A"), computer, location, false, true, false);
                // A = num1
                transfer2Computer(num1, computer, location, false, false, false);
                // D = D | A
                transfer2Computer(instructionMap.get("D|A"), computer, location, false, true, false);
                // A = location
                transfer2Computer(locationStream, computer, location, false, false, false);
                // A * = D
                transfer2Computer(instructionMap.get("D"), computer, location, false, false, true);
                location = (location + 1) % RAM_SIZE;
            }
            else if (list.get(1).equals("^")){
                boolean [] num0 = num2Stream(list.get(0));
                boolean [] num1 = num2Stream(list.get(2));

                // according to the value of location to decide the value of A
                boolean [] locationStream = setLocation(location);
                // A = num1
                transfer2Computer(num1, computer, location, false, false, false);
                // D = 0
                transfer2Computer(instructionMap.get("0"), computer, location, false, true, false);
                // D = D + A
                transfer2Computer(instructionMap.get("D+A"), computer, location, false, true, false);
                // A = num0
                transfer2Computer(num0, computer, location, false, false, false);
                // D = D ^ A
                transfer2Computer(instructionMap.get("D^A"), computer, location, false, true, false);
                // A = location
                transfer2Computer(locationStream, computer, location, false, false, false);
                // A * = D
                transfer2Computer(instructionMap.get("D"), computer, location, false, false, true);
                location = (location + 1) % RAM_SIZE;
            }
            else {
                System.out.println("Error or not implemented yet! ");
            }
            
        }
        
    }
}
