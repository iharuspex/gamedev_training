using Godot;
using System;

namespace GuessTheNumber
{
    public partial class Main : Node
    {
        [Export] 
        public uint SecretNumberRange { get; set; } = 100;

        private uint _secretNumber;

        public override void _Ready()
        {
            NewGame();
        }

        public override void _Input(InputEvent @event)
        {
            if (@event.IsActionPressed("check_input"))
            {
                CheckInput();
            }
        }

        private void OnButtonPressed()
        {
            NewGame();
        }

        private void CheckInput()
        {
            var answer = uint.Parse(GetNode<LineEdit>("Control/AnswerEdit").Text);
            GetNode<LineEdit>("Control/AnswerEdit").Clear();
            
            var answersBox = GetNode<TextEdit>("Control/Answers");

            if (answer > _secretNumber)
            {
                answersBox.Text = answer + " is greater then secret number!\n" + answersBox.Text;
                GD.Print(answer + " is greater then secret number!");
            } 
            else if (answer < _secretNumber)
            {
                answersBox.Text = answer + " is lesser then secret number!\n" + answersBox.Text;
                GD.Print(answer + " is lesser then secret number!");
            }
            else
            {
                answersBox.Text = answer + "! That is!\n" + answersBox.Text;
                GD.Print("Exactly!");

                GetNode<Button>("Control/Button").Visible = true;
                GetNode<LineEdit>("Control/AnswerEdit").Editable = false;
            }
        }

        private void NewGame()
        {
            GetNode<Button>("Control/Button").Visible = false;
            GetNode<LineEdit>("Control/AnswerEdit").Editable = true;
            GetNode<TextEdit>("Control/Answers").Clear();
            
            _secretNumber = GD.Randi() % SecretNumberRange;
        }
    }

}
