class PDA:
    def _init_(self):
        self.stack = ['Z0']
        self.state = 'q0'

    def process(self, s):
        for i, c in enumerate(s):
            if self.state == 'q0':
                if c == 'a': self.stack.append('a')
                elif c == 'b' and self.stack[-1] == 'a':
                    self.stack.pop()
                    self.state = 'q1'
                else: return False
            elif self.state == 'q1':
                if c == 'b' and self.stack[-1] == 'a':
                    self.stack.pop()
                else: return False
        return self.stack == ['Z0']

def test():
    pda = PDA()
    tests = ["abb", "aaabbb", "ab", "aaabbbab", "aabbbb", "abc", "aaabbbbbb"]
    for s in tests:
        print(f"{s}: {'Accepted' if pda.process(s) else 'Rejected'}")
        pda._init_()

if _name_ == "_main_":
    test()
