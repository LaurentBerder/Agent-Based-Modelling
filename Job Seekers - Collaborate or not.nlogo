globals [ applications jobs_found discouraged remaining_jobs]
;OtherGlobals   Max-energy    Energy-from-job    N-job-searchers
;               N-jobs   distance-per-tick    Vision    collaborate
breed [job-searchers job-searcher]

job-searchers-own [attempts energy]

to setup ;what happens when you click "setup"
  clear-all
  ask patches [set pcolor 9]
  grow-jobs
  set-default-shape job-searchers "person" ;; create job-searchers and set them up
  set remaining_jobs N-jobs
  create-job-searchers N-job-searchers
  [
    set color violet
    setxy random-xcor random-ycor
    set energy random Max-energy
    set attempts 0
    if collaborate[create-links-with n-of (N-job-searchers / 10) other job-searchers] ; create links (both-way links) to 10% of job-searchers at random for collaborative strategy
  ]
  set applications 0
  reset-ticks
end 

to go ;what happens when you click "go"
  ask job-searchers [find-job]
;set measures
  set remaining_jobs count patches with [pcolor = green]
  set jobs_found count patches with [pcolor = 7]
  set discouraged count job-searchers with [color = red]
;end go
  if count job-searchers with [color = violet] = 0 [stop]
  ;if ticks = 400 [stop]
  tick
end 

to grow-jobs
  ;ask n-of N-jobs patches [set pcolor green] ; set jobs totally randomly
  ask n-of N-clusters patches [ask n-of (N-jobs / N-clusters) patches in-radius 5 [set pcolor green]] ; set jobs randomly in clusters
end 

to find-job
  if (energy < 1000) and (energy > 0) ; keep looking as long as they don't have a job
       [
         rt random-float 50 ;; continuous random right turn up to 50°
         lt random 50 ;; discrete random left turn up to 50°
         let turn-distance random max-distance-per-tick
         fd turn-distance
         set energy energy - 1 * turn-distance / 2
       ]

  if pcolor = green
  [
    let recruit random 10
    set energy energy + Energy-from-application
    if recruit > 8 [
      set pcolor 7
      set energy energy + 1000 ; when you get a job, you get a bonus energy
      set color blue
      set shape "face happy" ]
    set attempts attempts + 1
    set applications applications + 1

    if collaborate[
    let found-job patch-here
    ask link-neighbors with [color = violet] [move-to one-of patch-set found-job] ; if you find a job, tell your friends to come where you found it
    ]
  ]
  if energy < 1 [
            set color red
            set shape "face sad"] ; once their energy runs out, they get discouraged stop searching
end 