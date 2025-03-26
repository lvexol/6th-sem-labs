class PDA:
    def __init__(self):
        self.stack = ['Z0']
        self.state = 'q0'

    def process(self, s):
        for c in s:
            if self.state == 'q0':
                if c == '0': self.stack.append('0')
                elif c == '1': self.stack.append('1'); self.state = 'q1'
                else: return False
            elif self.state == 'q1':
                if c == '1': self.stack.append('1')
                elif c == '2' and self.stack[-1] == '1': self.stack.pop(); self.state = 'q2'
                else: return False
            elif self.state == 'q2':
                if c == '2' and self.stack[-1] == '1': self.stack.pop()
                elif c == '3' and self.stack[-1] == '0': self.stack.pop(); self.state = 'q3'
                else: return False
            elif self.state == 'q3':
                if c == '3' and self.stack[-1] == '0': self.stack.pop()
                else: return False
        return self.stack == ['Z0']

def test():
    pda = PDA()
    tests = ["011223", "011233", "012233", "00112233", "011223", "0001112233", "0123"]
    for s in tests:
        print(f"{s}: {'Accepted' if pda.process(s) else 'Rejected'}")
        pda.__init__()

if __name__ == "__main__":
    test()
