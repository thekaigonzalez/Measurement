import std.stdio;
import std.conv;
import std.file;
import std.string;

int howMany(string chunk, bool show_messages = false) {
    string[] vec = split(chunk, "\n");

    int inc = 0;
    bool numberinmemory = false;
    int mem;

    foreach (string ent; vec) {
        int m = to!int(ent);

        if (mem != 0 && numberinmemory == true) { // if there's another number before
            // numberinmemory = true;
            if (m > mem) { // if it's greater (increased after)
                if (show_messages) {
                    writeln("better " ~ to!string(m));
                    writeln("than: " ~ to!string(mem));
                }
                inc ++; // increase the increases (lol)
                mem = m;
            } else { // if not then continue the loop, we're not counting those.
                if (show_messages) {
                    writeln("lost to: " ~ to!string(mem)); // lost to this number
                }
                mem = m;
                continue;
                
            }
        } else {
            numberinmemory = true; // now we've got something to work with (prevent trying to compare with no number)
            mem = m;
        }

        mem = m;
    }
    return inc;
}

void main() { // test
    writeln(howMany("100\n102\n3\n32\n1233\n4444\n32000\n123233", true));
}