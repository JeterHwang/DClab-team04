import React, { Component , useEffect, useState} from 'react';
import { Board } from './Board';
import './styles.css';

// 棋盤大小設定
const line = 19;

// Who is Winner ?
function calculateWinner(squares, x, y) {

  // before start
  if (x === null || y === null) {
    return null;
  }

  // position
  let n = 0;
  const board = [];
  for (let i = 0; i < line; i++) {
    board[i] = [];
    for (let j = 0; j < line; j++, n++) {
      board[i][j] = squares[n];
    }
  }
  const boardP = board[y][x];

  function checkTotal(currentX, currentY, directionX, directionY) {
    let nextX = currentX;
    let nextY = currentY;
    let total = 0;
    do {
      nextX += directionX;
      nextY += directionY;

      if (
        nextX >= 0 && nextX < line
        && nextY >= 0 && nextY < line
        && board[nextY][nextX] === boardP
      ) {
        total++;
      } else {
        break;
      }
    } while (total);
    return total;
  }

  if (
    checkTotal(x, y, 1, 0) + checkTotal(x, y, -1, 0) >= 4
    || checkTotal(x, y, 0, 1) + checkTotal(x, y, 0, -1) >= 4
    || checkTotal(x, y, 1, 1) + checkTotal(x, y, -1, -1) >= 4
    || checkTotal(x, y, 1, -1) + checkTotal(x, y, -1, 1) >= 4
  ) {
    return boardP;
  }

  return null;
}

function Info(props) {
  return (
    <div className="game-info">
      <div className={props.winner ? 'game-status  winner' : 'game-status'}>
        {props.status}
      </div>
    </div>
  );
}

function Goback(props) {
  return (
    <div role="button" className="game__toggle" onClick={props.onClick}>
      Wanna go back ?
    </div>
  );
}

function Sidebar(props) {
  return (
    <aside className={props.toggle ? 'aside active' : 'aside'}>
      <h2 className="aside__title">Oops !?</h2>
      <ul>
        {props.moves}
      </ul>
    </aside>
  );
}


function App (){
      const [cord, setCord] = useState(null);
      
      // Fetch coordinates
      const fetchData = async () => {
        const res = await fetch("/api");
        const json = await res.json();
        console.log(res)
        setCord(json);
      };
      // const fetchData = async () => {
      //   const res = await fetch("/api", { method: "POST", body: );
      //   const json = await res.json();
      //   console.log(res)
      //   setCord(json);
      // };
      const [history, setHistory] = useState([
                                        {
                                          squares: Array(line * line).fill(null),
                                          currentX: null,
                                          currentY: null,
                                        },
                                      ])
      const [stepNumber, setStepNumber] =  useState(0)                       
      const [xIsNext, setIsNext] = useState(true)
      const [toggle, setToggle] = useState(false)


  const toggleClick = () => { setToggle(!toggle) }

  
  const handleClick = (i) => {
    const allhistory = history.slice(0, stepNumber + 1);
  
    console.log("allHistory: ", allhistory)
    const current = allhistory[allhistory.length - 1]; //下完後的上一步
    const squares = current.squares.slice(); // return an array of null or white or black
    console.log("current: ", current)
    console.log("squares: ", squares)
    if (calculateWinner(squares, current.currentX, current.currentY) || squares[i]) {
      return;
    }
    squares[i] = xIsNext ? 'black' : 'white'; // xIsNext是判斷黑或白 1為黑 0為白
    setHistory(allhistory.concat([
      {
        squares,
        currentX: (i % line),
        currentY: parseInt((i / line), 10),
      },
    ]))
    setStepNumber(allhistory.length)
    setIsNext(!xIsNext)
  }


  const jumpTo = (step) => {
    setStepNumber(step)
    setIsNext((step % 2) === 0)
  }


    console.log("history: ", history)
    console.log("stepNumber: ", stepNumber)
    console.log("xIsNext: ", xIsNext)
    console.log("toggle: ", toggle)
    console.log("cord: ", cord)

    const current = history[stepNumber];
    const winner = calculateWinner(current.squares, current.currentX, current.currentY);

    const moves = history.map((step, move) => (
      <li className="step__item" key={move}>
        <button
          className="btn move"
          type="button"
          onClick={() => jumpTo(move)}
        >
          {move ? `Go to move #${move}` : 'Restart'}
        </button>
      </li>
    ));

    let status;
    if (winner) {
      status = `Winner : ${winner}`;
    } else {
      status = `Next player: ${(xIsNext ? 'black' : 'white')}`;
    }

    return (
      <div>
        <div className={toggle ? 'game active' : 'game'}>
          <Goback
            onClick={toggleClick}
          />
          <Info
            winner={winner}
            status={status}
          />
          <Board
            winner={winner}
            squares={current.squares}
            line={line}
            onClick={i => handleClick(i)}
          />
        </div>
        <Sidebar
          toggle={toggle}
          moves={moves}
        />
      </div>
    );
  }


export default App;
