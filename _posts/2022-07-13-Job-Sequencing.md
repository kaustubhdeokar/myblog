---
layout: post
title: Job Sequencing Problem
categories: jekyll string
description: Job Sequencing Problem
summary: Job Sequencing Problem
comments: true
tags: [competitive coding]
---

```
public int maxProfitByJobSequencing(Job arr[], int n) {

        Comparator<Job> compareByDeadlineAndProfit = (Job j1, Job j2) ->
                Integer.compare(j2.profit, j1.profit);
        //arrange the jobs in decreasing order of profit.

        PriorityQueue<Job> heap = new PriorityQueue<>(compareByDeadlineAndProfit);
        int maxDeadline = Integer.MIN_VALUE;
        for(int i=0;i<arr.length;i++){
            maxDeadline = Integer.max(maxDeadline, arr[i].deadline);
            heap.add(arr[i]);
        }


        int[] slots = new int[arr.length];

        while (!heap.isEmpty()) {
            Job job = heap.poll();

            for (int i = job.deadline; i >= 0; i--) {
                if (slots[i] == 0) {
                    slots[i] = job.profit;
                    break;
                }
            }

        }

        return -1;
    }

    static class Job {
        int id, profit, deadline;

        Job(int x, int y, int z) {
            this.id = x;
            this.deadline = y;
            this.profit = z;
        }

        @Override
        public String toString() {
            return "Job{" +
                    "id=" + id +
                    ", profit=" + profit +
                    ", deadline=" + deadline +
                    '}';
        }
    }

    public static void main(String[] args) {
        JobSequencing jobSequencing = new JobSequencing();
        Job[] arr = {new Job(1, 4, 20), new Job(2, 1, 10), new Job(3, 1, 40), new Job(4, 1, 30)};
        jobSequencing.maxProfitByJobSequencing(arr, 4);
    }

```