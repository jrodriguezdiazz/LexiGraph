package code;

import javax.swing.*;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import java.io.*;

public class Frame {
    private JTextField input;
    private JTextArea output;
    private JButton button1;

    public Frame() {
        button1.addKeyListener(new KeyAdapter() {
            @Override
            public void keyTyped(KeyEvent e) {
                super.keyTyped(e);
                File file = new File("file.txt");
                try (PrintWriter writer = new PrintWriter(file)) {
                    writer.print(input.getText());
                } catch (FileNotFoundException ex) {
                    ex.printStackTrace();
                }

                try {
                    Reader reader = new BufferedReader(new FileReader("file.text"));
                    Lexer lexer = new Lexer(reader);
                    String result = "";
                    while (true) {
                        Tokens tokens = lexer.yylex();
                        if (tokens == null) {
                            result += "END";
                            output.setText(result);
                            return;
                        }

                        switch (tokens) {
                            case ERROR:
                                result += "Symbol not defined";
                                break;
                            case Identificador:
                            case Numero:
                            case Reservada:
                                result += lexer.lexeme + ": is " + tokens + "\n";
                                break;
                            default:
                                result += "Token " + tokens + "\n";
                        }
                    }
                } catch (FileNotFoundException ex) {
                    ex.printStackTrace();
                } catch (IOException ex) {
                    throw new RuntimeException(ex);
                }
            }
        });
    }
}
