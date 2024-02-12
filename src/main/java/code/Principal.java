package code;
import jflex.Main;
import jflex.exceptions.SilentExit;

public class Principal {

    public static void main(String[] args) throws SilentExit {
        String path = "/Users/jorge_rodriguez2/Desktop/personal/Lexi/src/main/java/code/Lexer.flex";
        generateLexer(path);
    }

    public static void generateLexer(String path) throws SilentExit {
        String[] jflexArgs = { path };
        Main.generate(jflexArgs);
    }
}
