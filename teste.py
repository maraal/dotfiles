def add(x: int, y: int) -> int:
    return  x + y

def subtract(x: int, y: int) -> int:
    return x - y

def divide(x: int, y: int) -> float:
    if y == 0:
        raise Exception("Impossible to divide")

    return x / y

def multiply(x: int, y: int) -> int:
    """
    Multiplies two integer numbers and returns the result.
    """
    return x * y


