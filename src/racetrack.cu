#include <cmath>
#include <iostream>
#include <limits>
#include <string>

enum spin 
{
    UP = 1,
    DOWN = -1    
};

class cell
{
    public:
        spin SPIN;
        double U_H;
    
    void potential(int j,int i)
    {
        U_H = SPIN/abs(j - i);
    }
    
};

class track
{
    public:
        int length;
    
    cell* TRACK_START;

    void set_track()
    {
        TRACK_START = (cell*)malloc(sizeof(cell)*length);
    }
    void assign_cell(int i,cell unit)
    {
        *(TRACK_START+i) = unit;
    }
    void display_track()
    {
        for(int i=0;i<length;i++)
        {
            std::cout<<(*(TRACK_START+i)).SPIN<<"\n";
        }
    }
};

int main(int argc, char* argv[])
{
    int LENGTH = std::stoi(argv[1]);

    cell test;
    test.SPIN = DOWN;
    std::cout<<test.SPIN<<"\n";
    
    track test_track;
    test_track.length = LENGTH;
    test_track.set_track();
    
    for(int i=0;i<LENGTH;i++)
    {
        if(i%2==0)
            test.SPIN = UP;
        else
            test.SPIN = DOWN;
        test_track.assign_cell(i,test);
    }
    test_track.display_track();

    return 0;
}