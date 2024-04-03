using Godot;
using System;

public partial class Control : Node
{
    private uint _secretNumber = GD.Randi() % 100;

    public override void _Ready()
    {
        base._Ready();
    }
}
