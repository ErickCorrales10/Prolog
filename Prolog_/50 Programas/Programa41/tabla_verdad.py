def and_operation(A, B):
    return A and B

def table(A, B, expr):
    result = expr(A, B)
    print(f"{A} {B} {result}")

def generate_truth_table():
    print("A B Result")
    table(True, True, and_operation)
    table(True, False, and_operation)
    table(False, True, and_operation)
    table(False, False, and_operation)

generate_truth_table()
