using Godot;
using System;

namespace GuessTheNumber
{
    public partial class Main : Node
    {
        private uint _secretNumber = GD.Randi() % 100;

        public override void _Ready()
        {
            base._Ready();
        }

        private void OnButtonPressed()
        {
            var answer = uint.Parse(GetNode<TextEdit>("Control/AnswerEdit").Text);

            if (answer > _secretNumber)
            {
                //GetNode<Label>("Control/Answers").Text = answer + " is greater then secret number!";
                GD.Print(answer + " is greater then secret number!");
            } 
            else if (answer < _secretNumber)
            {
                GD.Print(answer + " is lesser then secret number!");
            }
            else
            {
                GD.Print("Exactly!");
            }
        }
    }

}
