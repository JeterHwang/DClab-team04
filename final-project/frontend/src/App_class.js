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
function App() {
  const [cord, setCord] = useState(null);
  
  // Fetch coordinates
  const fetchData = async () => {
    const res = await fetch("/api");
    const json = await res.json();
    console.log(res)
    setCord(json);
  };
  useEffect(() => {
    fetchData()
  }, []);
  return (<Coordinate fetchData={fetchData} cord={cord}/>)
}

class Coordinate extends Component {
  constructor(props) {
    super(props);

    this.state = {
      history: [
        {
          squares: Array(line * line).fill(null),
          currentX: null,
          currentY: null,
        },
      ],
      stepNumber: 0,
      xIsNext: true,
      toggle: false,
      // cord: props.cord
    };
  }

  toggleClick = () => {
    const { toggle } = this.state;
    this.setState({
      toggle: !toggle,
    });
  }

  
  handleClick = (i) => {
    const { history, xIsNext, stepNumber } = this.state;
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
    this.setState({
      history: allhistory.concat([
        {
          squares,
          currentX: (i % line),
          currentY: parseInt((i / line), 10),
        },
      ]),
      stepNumber: allhistory.length,
      xIsNext: !xIsNext,
    });
  }


  jumpTo = (step) => {
    this.setState({
      stepNumber: step,
      xIsNext: (step % 2) === 0,
    });
  }

  render() {
    console.log("history: ", this.state.history)
    console.log("stepNumber: ", this.state.stepNumber)
    console.log("xIsNext: ", this.state.xIsNext)
    console.log("toggle: ", this.state.toggle)
    console.log("cord: ", this.props.cord)

    const { history, toggle } = this.state;
    const current = history[this.state.stepNumber];
    const winner = calculateWinner(current.squares, current.currentX, current.currentY);

    const moves = history.map((step, move) => (
      <li className="step__item" key={move}>
        <button
          className="btn move"
          type="button"
          onClick={() => this.jumpTo(move)}
        >
          {move ? `Go to move #${move}` : 'Restart'}
        </button>
      </li>
    ));

    let status;
    if (winner) {
      status = `Winner : ${winner}`;
    } else {
      status = `Next player: ${(this.state.xIsNext ? 'black' : 'white')}`;
    }

    return (
      <div>
        <div className={toggle ? 'game active' : 'game'}>
          <Goback
            onClick={this.toggleClick}
          />
          <Info
            winner={winner}
            status={status}
          />
          <Board
            winner={winner}
            squares={current.squares}
            line={line}
            onClick={i => this.handleClick(i)}
          />
        </div>
        <Sidebar
          toggle={toggle}
          moves={moves}
        />
      </div>
    );
  }
}

export default App;
