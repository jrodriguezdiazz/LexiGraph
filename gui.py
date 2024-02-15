import tkinter as tk
from tkinter.scrolledtext import ScrolledText
from LexicalAnalyzer import LexicalAnalyzer


def analyze_code():
    code = input_text.get("1.0", tk.END)
    output_text.delete("1.0", tk.END)
    try:
        tokens, lexemes, rows, columns = analyzer.tokenize(code)
        for i in range(len(tokens)):
            output_text.insert(tk.END, f'LexToken({tokens[i]}, \'{lexemes[i]}\', {rows[i]}, {columns[i]})\n')
    except RuntimeError as e:
        output_text.insert(tk.END, f'Error: {e}')


root = tk.Tk()
root.title("Analizador Léxico")

analyzer = LexicalAnalyzer()

input_text = ScrolledText(root, height=15, width=60, padx=10, pady=10, wrap=tk.WORD, borderwidth=2, relief="sunken")
input_text.config(font=('Arial', 12), background="white", foreground="black")
input_text.pack(padx=10, pady=5, fill=tk.BOTH, expand=True)
output_text = ScrolledText(root, height=15, width=60, padx=10, pady=10, wrap=tk.WORD, borderwidth=2, relief="sunken")
output_text.config(font=('Arial', 12), background="white", foreground="black")
output_text.pack(padx=10, pady=5, fill=tk.BOTH, expand=True)

analyze_button = tk.Button(root, text="Analizar", command=analyze_code)
analyze_button.pack(pady=5)

root.mainloop()
