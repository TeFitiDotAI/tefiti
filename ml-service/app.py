from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI()

class ProblemInput(BaseModel):
    text: str
    description: str

@app.post('/summarise/')
def summarise(problem: ProblemInput):
    return {"summary": problem.description[:100] + '...'}

@app.post("/solve_problem/")
async def solve_problem(problem: ProblemInput):
    # Here you would integrate your ML model to solve the problem
    # For demonstration, let's just return the input text
    return {"solution": f"The problem received was: {problem.text}"}