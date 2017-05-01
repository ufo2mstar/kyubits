data = [
    {a: 12, b: 22},
    {a: 10, b: 20},
    {a: 14, b: 30},
    {a: 18, b: 26},

    {a: 12, b: 32},
    {a: 10, b: 30},
    {a: 14, b: 40},
    {a: 18, b: 36},
]

p data.sort_by!{|h| h[:a]}

p data.sort_by!{|h| h[:b]}

n=0
p data.sort_by!{|h| n+=1; [h[:a],n]}.sort_by!{|h| n+=1; [h[:b],n]}