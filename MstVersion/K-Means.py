#! /usr/bin/env python
# -*- coding: utf-8 -*-
import os
import sys
import cmath
import os.path

class KMeans:
    '''
    @descriptions: K-means Algorithm implementation. 
    @filename:     Filename of input data.
    @knums:        Clusters number.
'''
    def __init__(self, filename, knums):
        self._filename = filename;
        self._knums = knums
        self._dimension = 0
        """self._samples := [(seqx, x1, x2, ..., xn), 
                             (seqy, y1, y2, ..., yn), 
                             ..., 
                             (seqz, z1, z2, ..., zn)]"""
        self._samples= []
        """self._clusters :=[[(0, c1, c2, ..., cn), (seqx, x1, x2, ..., xn), (seqy, y1, y2, ..., yn)], 
                             [], 
                             ..., 
                             []]"""
        self._clusters = []
        
        self._open(self._filename)
        self._normalize()
        #print self._samples
        self._select(self._knums)
    
    
    def _normalize(self):
        """
        @description: Normalize the attributes of input data.
"""
        new_samples = []
        for t in xrange(len(self._samples)):
            st = list(self._samples[t])
            new_samples.append(st)
        
        for t in xrange(len(self._samples)):
            self._samples.pop()
             
        for d in xrange(1, (self._dimension + 1)):
            container_att = []
            for idx in xrange(len(new_samples)):
                att = new_samples[idx][d]
                container_att.append(att)
            
            max_att = max(container_att)
            min_att = min(container_att)
            
            for idx in xrange(len(new_samples)):
                new_att = (new_samples[idx][d] - min_att) / (max_att - min_att)
                new_samples[idx][d] = new_att
                
        for t in xrange(len(new_samples)):
            st = tuple(new_samples[t])
            self._samples.append(st)
            
    
    
    def _open(self, filename):
        """
        @descriptions: Open the data file and fill each item into memory.
        @filename    : Filename of input data.
"""
        data_file= open(self._filename, "r")
        data_lines= data_file.readlines();
        for line in data_lines:
            string_samples = line.split("")
            integer_samples= []

            integer_samples.append(int(string_samples[0]))

            for e in string_samples[1:]:
                integer_samples.append(float(e))
            samples = tuple(integer_samples)
            self._samples.append(samples)
        #print self._samples
        self._dimension = len(self._samples[0]) - 1
        #print self._dimension


    def _select(self, knums):
        """
        @descriptions: Choose the first knums cluster center.
        @knums       : Clusters number.
"""
        for i in xrange(knums):
            selected = self._samples[i]
            temp = list(selected)
            temp[0] = 0
            self._clusters.append([])
            self._clusters[i].append(temp)
        #print self._clusters


    def _distance(self, va, vb):
        '''
        @description: Return the (distance ** 2) of tuple va and tuple vb.
        @va         : tuple va (x1, x2, ..., xn)
        @vb         : tuple vb (y1, y2, ..., yn)
'''
        distance = 0
        for i in xrange(self._dimension):
            distance += (va[i] - vb[i]) * (va[i] - vb[i]) 
        #print distance
        
        return distance


    def _means(self, va):
        """
        @description: Return the means of va.
        @va         : A tuple of list va, with the form [(flagx, x1, x2, ..., xn), 
                                                         (flagy, y1, y2, ..., yn), 
                                                         (flagz, z1, z2, ..., zn), ...]
"""
        if (len(va) == 0):
            return va
        
        means_cluster = []
        means_cluster.append(1)#Indicate that the means has changed.
        
        #print va
        for d in xrange(self._dimension):
            tmp = 0
            for i in xrange(len(va)):
                tmp += va[i][d+1]
            means_cluster.append(tmp/len(va))
        means = tuple(means_cluster)
        
        return means
    
    def _equal(self, ta, tb):
        """
        @description: Check if tuple ta equals to tuple tb.
        @ta         : Tuple ta.(flagx, x1, x2, ..., xn)
        @tb         : Tuple tb.(flagy, y1, y1, ..., ym)
"""
        if (len(ta) != len(tb)):
            return False
        
        for i in xrange(1, len(ta)):
            if (ta[i] != tb[i]):
                return False
            
        return True
    
    def flush(self, filename):
        """
        @description: Flush data the disk.
        @filename   : Filename of output data.
"""
        foutput = open(filename, "w")
        
        for c in xrange(self._knums):
            foutput.write("Group %d" % c)
            for e in self._clusters[c][1:]:
                foutput.write("%s" %  repr(e))
            foutput.write("\n\n\n")
        print("Done.")
        foutput.close()

    def _reconstruct(self, idx):
        """
        @description: Reconstruct the cluster points.
        
        @idx         : Index of clusters, where clusters has the form as follows:
        self._clusters :=[[(0, c1, c2, ..., cn), (seqx, x1, x2, ..., xn), (seqy, y1, y2, ..., yn)], 
                          [], 
                          ..., 
                          []]
"""
        new_cluster = []
        new_cluster.append(0)
        for old_value in self._clusters[idx][0][1:]:
            new_cluster.append(old_value)
        for i in xrange(len(self._clusters[idx])):
            self._clusters[idx].pop()
        self._clusters[idx].insert(0, new_cluster)


    def process(self):
        """
        @description: Process data, calculating k-means and clustering.
"""
        while True:
            K = 0
            for e in self._samples:
                #print e  
                shortest = -1
                for k in xrange(self._knums):
                    #for k in _clusters[]
                    #print e
                    #print self._clusters[k][0]
                    distance = self._distance(e[1:], self._clusters[k][0][1:])
                    #print distance
                    if (distance < 0.000001):
                        # add e to the k-th cluster.
                        self._clusters[k].append(e)
                        break
                    else:
                        if (shortest == -1):
                            shortest = distance
                        else:
                            if (shortest > distance):
                                shortest = distance
                                K = k
                    if (k != self._knums - 1):
                        continue
                    else:
                        # add e to the k-th cluster
                        self._clusters[K].append(e)
            #print self._clusters

            for k in xrange(self._knums):
                new_ktuple = self._means(self._clusters[k][1:])
                if (len(new_ktuple) == 0):
                    continue
                if (self._equal(self._clusters[k][0], new_ktuple) == False):
                    self._clusters[k].pop(0)
                    self._clusters[k].insert(0, new_ktuple)
                         
                else:
                    continue
                
            flag = 0
            for idx in xrange(self._knums):
                if (self._clusters[idx][0][0] == 1):
                    flag = 1
                    break
                else:
                    continue

            if (flag == 1):
                for idx in xrange(self._knums):
                    self._reconstruct(idx) 
            else:
                break


if __name__ =="__main__":
    ikmeans = KMeans("./iris-1.dat", 3)
    ikmeans.process()
    ikmeans.flush("./k-means-out.dat")
