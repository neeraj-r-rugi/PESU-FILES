def readcon():                                                 # my time: 3 minutes
    with open("sessions.txt", "r") as f1:
        con = f1.readlines();
    return con;


def sub1_find_total_num_of_sessions_print_unique_speakers():    # my time: 7 minutes
    con = readcon();
    speakers = [];
    count = 0;
    for line in con:
        count+=1;
        rec = line.split(",")                 
        if rec[1].strip() not in speakers:      # strip functions unnecessary here if map function used above
            speakers.append(rec[1].strip());
    return (count, len(speakers))
    
    
def sub2_insert_given_data(title, name, time):      # my time: 3 minutes
    newrec = [f"{title}, {name}, {time}\n"];
    with open("sessions.txt", "a") as f1:
        f1.writelines(newrec);
    print("Record inserted.")

def sub3_total_sessions_of_each_speaker():        # my time: 7 minutes
    con = readcon();
    sessions = {};
    for line in con:
        rec = line.split(",");
        name = rec[1].strip();
        if name in sessions:
            sessions[name]+=1;
        else:
            sessions[name]=1;
    if sessions:
        print("Count of sessions by each speaker is as below")
        for i in sessions:
            print(i,"-",sessions[i]);
    else:
        print("No data to display.")

def sub4_remove_sessions_by_particular_speaker(name):     # my time: 7 minutes
    con = readcon();
    flag = 0;
    for line in con:
        recname = line.split(",")[1].strip();
        if recname==name:
            con.remove(line);
            flag=1;
    with open("sessions.txt", "w") as f2:
        f2.writelines(con);
    if flag:
        print(f"Sessions by {name} removed.")
    else:
        print("No sessions present for given speaker name.")

def sub5_num_of_sessions_at_each_timeslot():     # my time: 10 minutes
    times = {};
    con = readcon();
    for line in con:
        time = line.split(",")[2].strip();
        if time in times:
            times[time]+=1;
        else:
            times[time]=1;
    if not times:
        print("No sessions avaiable")
    else:
        print("Count of sessions at each time slot is as below")
        for i in times:
            print(f"{i} - {times[i]} session(s)");

def sub6_list_sessions_and_timeslots_for_each_speaker():     # my time: 6 minutes
    speakers = {};
    con = readcon();
    for line in con:
        name = line.split(",")[1].strip();
        rec = line.split(",");
        if name in speakers:
            speakers[name].append([rec[0].strip(), rec[2].strip()]);
        else:
            speakers[name] = [];
            speakers[name].append([rec[0].strip(), rec[2].strip()]);
    if not speakers:
        print("Speaker and session details not available. Sorry!")
    else:
        for i in speakers:
            print(f"Speaker: {i}");
            for rec in speakers[i]:
                print(f"    {rec[0]} - {rec[1]}");

def sub7_delete_all_sessions():     # my time: 30 seconds
    open("sessions.txt", "w");
    print("All sessions deleted for the day.");

def return_name(x):
    return x[1];

def sub8_sort_based_on_name():      # my time: 10 minutes
    con = readcon();
    lines = [];
    for line in con:
        rec = line.split(",");
        lines.append(rec);
    if not lines:
        print("Speaker and session details not available. Sorry!")
    else:
        lines.sort(key=return_name);
        for i in lines:
            print(f"{i[0]}, {i[1]}, {i[2]}");

while True:                                          #my time: First 10 minutes to decide the interface
    print("Enter subquestion number to access its solution, or enter 0 to exit.\n");
    ch = int(input("Enter choice: "));
    if ch==1:
        count_of_sessions, count_of_speakers = sub1_find_total_num_of_sessions_print_unique_speakers()
        if count_of_sessions == 0 and  count_of_speakers == 0:
            print("No data to display")
        else:
            print("Number of sessions:",count_of_sessions);
            print("Unique speakers:",count_of_speakers);
    elif ch==2:
        name = input("Enter the name of the speaker: ").strip()
        title = input("Enter the title of the talk: ").strip()
        time = input("Enter the time (hh:mm): ").strip()
        sub2_insert_given_data(title, name, time)
    elif ch==3:
        sub3_total_sessions_of_each_speaker()
    elif ch==4:
        name = input("Enter the name of the unavailable speaker: ");
        sub4_remove_sessions_by_particular_speaker(name);
    elif ch==5:
        sub5_num_of_sessions_at_each_timeslot()
    elif ch==6:
        sub6_list_sessions_and_timeslots_for_each_speaker()
    elif ch==7:
        sub7_delete_all_sessions()
    elif ch==8:
        sub8_sort_based_on_name()
    elif ch==0:
        break
    else: 
        print("Invalid choice.\n")