> First level blockquote
> > Second level blockquote
>> Second level blockquote
> > > Third level blockquote
>>> Third level blockquote

> # Nested elements problem
> Nested elements inside blockquotes and other elements could be very problematic
>
> ## A conscious choice
> I chose to not highlight nested elements because:
> * things could get really nasty in the syntax definition
> * the end result could get confusing for the user (ex. No difference in the highlight between an headline inside and outside a blockquote)
>
> ## An alternative solution
> MdEditBlock will open the next level of the Blockquote block under cursor in a scratch buffer with a markdown syntax highlight
